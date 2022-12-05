// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:md5_file_checksum/md5_file_checksum.dart';
// import 'package:morphosis_template/core/global/graphql/gql_service_impl.dart';
// import 'package:morphosis_template/di/injectable.dart';
// import 'package:morphosis_template/features/login/domain/queries/auth_queries.dart';
// import 'package:morphosis_template/features/upload/data/model/create_direct_upload_response.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;
//
// //
// //
// part 'upload_document_state.dart';
//
// class UploadDocumentCubit extends Cubit<UploadDocumentState> {
//   UploadDocumentCubit() : super(const UploadDocumentInitial());
//
//   Future<Either<UploadImageResponse, Exception>> getSignedURL(File file) async {
//     //convert file to md5
//     final dir = await path_provider.getTemporaryDirectory();
//     final targetPath = '${dir.absolute.path}/temp.jpg';
//
//     final compressedFile = await testCompressAndGetFile(file, targetPath);
//
//     try {
//       final fileChecksum =
//           await Md5FileChecksum.getFileChecksum(filePath: compressedFile!.path);
//
//       final fileName = compressedFile.path.split('/').last;
//       final fileExtension = compressedFile.path.split('/').last.split('.').last;
//
//       try {
//         final _options = MutationOptions(
//           document: gql(AuthQueries.uploadDocumentQuery(
//             filename: fileName,
//             byteSize: compressedFile.lengthSync(),
//             checksum: fileChecksum,
//             contentType: 'image/$fileExtension',
//           )),
//           variables: const <String, dynamic>{
//             'Content-Type': 'application/json',
//           },
//         );
//
//         emit(const UploadDocumentLoading());
//
//         final response =
//             await getIt<GraphQLServiceImpl>().graphQLClient!.mutate(_options);
//
//         if (response.data != null) {
//           if (kDebugMode) {
//             print('response data: ${response.data}');
//           }
//
//           final json = UploadImageResponse.fromJson(response.data!);
//
//           try {
//             // final fileName = file.path.split('/').last.split('.').first;
//             // final fileExtension = file.path.split('/').last.split('.').last;
//
//             final baseUrl = json.createDirectUpload.directUpload.url;
//             // final headers = json.createDirectUpload.directUpload.headers;
//
//             try {
//               final imageBytes = compressedFile.readAsBytesSync();
//               // final base64Image = base64Encode(imageBytes);
//
//               final response = await http.put(
//                 Uri.parse(baseUrl),
//                 headers: <String, String>{
//                   'Content-MD5': fileChecksum,
//                   'content-type': 'image/$fileExtension'
//                 },
//                 body: imageBytes,
//               );
//
//               if (response.statusCode == 200) {
//                 emit(UploadDocumentSuccess(
//                     imageUrlFromServer: json.createDirectUpload.signedId));
//
//                 return left(json);
//               } else {
//                 emit(UploadDocumentFailure(exception: Exception(response)));
//
//                 return right(Exception('Seomething went wrong.'));
//               }
//             } on HttpException catch (e) {
//               emit(UploadDocumentFailure(exception: Exception(e)));
//
//               return right(e);
//             }
//           } catch (e) {
//             emit(UploadDocumentFailure(exception: Exception(e)));
//             return right(Exception(e));
//           }
//         } else if (response.hasException) {
//           final error =
//               response.exception!.linkException as HttpLinkServerException;
//
//           final errorMessage =
//               error.parsedResponse!.response['error'] as String;
//
//           emit(UploadDocumentFailure(exception: Exception(errorMessage)));
//
//           return right(Exception(errorMessage));
//         } else {
//           return right(Exception('Seomething went wrong.'));
//         }
//       } on HttpLinkServerException catch (e) {
//         return right(e);
//       } on ServerException catch (e) {
//         return right(e);
//       } on LinkException catch (e) {
//         return right(e);
//       } on Exception catch (e) {
//         return right(e);
//       }
//     } catch (exception) {
//       if (kDebugMode) {
//         print('Unable to generate file checksum: $exception');
//       }
//
//       return right(Exception(exception));
//     }
//   }
//
//   Future<File?> testCompressAndGetFile(File file, String targetPath) async {
//     final result = await FlutterImageCompress.compressAndGetFile(
//       file.absolute.path,
//       targetPath,
//       quality: 50,
//       minWidth: 400,
//       minHeight: 400,
//     );
//     return result;
//   }
// }
