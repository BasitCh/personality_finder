part of 'upload_document_bloc.dart';

@immutable
abstract class UploadDocumentEvent {}

class GetSignedUrl extends UploadDocumentEvent {
  final File file;

  GetSignedUrl({required this.file});
}
