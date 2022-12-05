import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:md5_file_checksum/md5_file_checksum.dart';
import 'package:morphosis_template/core/global/graphql/gql_service_impl.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/login/domain/queries/auth_queries.dart';
import 'package:morphosis_template/features/upload/data/model/create_direct_upload_response.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

part 'upload_document_event.dart';

part 'upload_document_state.dart';

class UploadDocumentBloc
    extends Bloc<UploadDocumentEvent, UploadDocumentState> {
  UploadDocumentBloc() : super(UploadDocumentInitial()) {
    // delete user account
    on<GetSignedUrl>((event, emit) async {
      //convert file to md5
      final dir = await path_provider.getTemporaryDirectory();
      final targetPath = '${dir.absolute.path}/temp.jpg';

      final compressedFile =
          await testCompressAndGetFile(event.file, targetPath);

      try {
        final fileChecksum = await Md5FileChecksum.getFileChecksum(
            filePath: compressedFile!.path);

        final fileName = compressedFile.path.split('/').last;
        final fileExtension =
            compressedFile.path.split('/').last.split('.').last;

        try {
          final _options = MutationOptions(
            document: gql(AuthQueries.uploadDocumentQuery(
              filename: fileName,
              byteSize: compressedFile.lengthSync(),
              checksum: fileChecksum,
              contentType: 'image/$fileExtension',
            )),
            variables: const <String, dynamic>{
              'Content-Type': 'application/json',
            },
          );

          emit(UploadDocumentLoading());

          final response =
              await getIt<GraphQLServiceImpl>().graphQLClient!.mutate(_options);

          if (response.data != null) {
            if (kDebugMode) {
              print('response data: ${response.data}');
            }

            final json = UploadImageResponse.fromJson(response.data!);

            try {
              // final fileName = file.path.split('/').last.split('.').first;
              // final fileExtension = file.path.split('/').last.split('.').last;

              final baseUrl = json.createDirectUpload.directUpload.url;
              // final headers = json.createDirectUpload.directUpload.headers;

              try {
                final imageBytes = compressedFile.readAsBytesSync();
                // final base64Image = base64Encode(imageBytes);

                final response = await http.put(
                  Uri.parse(baseUrl),
                  headers: <String, String>{
                    'Content-MD5': fileChecksum,
                    'content-type': 'image/$fileExtension'
                  },
                  body: imageBytes,
                );

                if (response.statusCode == 200) {
                  emit(UploadDocumentSuccess(
                      imageUrlFromServer: json.createDirectUpload.signedId));
                } else {
                  emit(UploadDocumentFailure(exception: Exception(response)));
                }
              } on HttpException catch (e) {
                emit(UploadDocumentFailure(exception: Exception(e)));
              }
            } catch (e) {
              emit(UploadDocumentFailure(exception: Exception(e)));
            }
          } else if (response.hasException) {
            final error =
                response.exception!.linkException as HttpLinkServerException;

            final errorMessage =
                error.parsedResponse!.response['error'] as String;

            emit(UploadDocumentFailure(exception: Exception(errorMessage)));
          } else {}
        } on HttpLinkServerException catch (e) {
          emit(UploadDocumentFailure(
              exception: Exception(e.response.body.toString())));
        } on ServerException catch (e) {
          emit(UploadDocumentFailure(exception: Exception(e.toString())));
        } on LinkException catch (e) {
          emit(UploadDocumentFailure(exception: Exception(e.toString())));
        } on Exception catch (e) {
          emit(UploadDocumentFailure(exception: Exception(e.toString())));
        }
      } catch (exception) {
        if (kDebugMode) {
          print('Unable to generate file checksum: $exception');
        }
      }
    });
  }
}

Future<File?> testCompressAndGetFile(File file, String targetPath) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: 50,
    minWidth: 400,
    minHeight: 400,
  );
  return result;
}
