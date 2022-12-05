part of 'upload_document_bloc.dart';

@immutable
abstract class UploadDocumentState {}

class UploadDocumentInitial extends UploadDocumentState {}

class UploadDocumentSuccess extends UploadDocumentState {
  final String imageUrlFromServer;

  UploadDocumentSuccess({required this.imageUrlFromServer});
}

class UploadDocumentSignedSuccess extends UploadDocumentState {
  final UploadImageResponse imageUrlFromServer;

  UploadDocumentSignedSuccess({required this.imageUrlFromServer});
}

class UploadDocumentSignedFailure extends UploadDocumentState {
  final Exception? exception;

  UploadDocumentSignedFailure({this.exception});
}

class UploadDocumentFailure extends UploadDocumentState {
  final Exception? exception;

  UploadDocumentFailure({this.exception});
}

class UploadDocumentLoading extends UploadDocumentState {
  UploadDocumentLoading();
}
