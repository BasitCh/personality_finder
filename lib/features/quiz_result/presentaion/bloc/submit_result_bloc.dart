// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../../../core/global/error/network_exceptions.dart';
import '../../domain/enties/submit_data.dart';
import '../../domain/repositories/quiz_result_repo.dart';

part 'submit_result_event.dart';
part 'submit_result_state.dart';

class SubmitQuizResultBloc extends Bloc<SubmitResultEvent, SubmitResultState> {
  final QuizResultRepo quizResultRepo;
  SubmitQuizResultBloc({required this.quizResultRepo})
      : super(SubmitQuizInitial()) {
    on<SubmitQuizUpload>((event, emit) async {
      emit(const SubmitQuizUploading());
      final data = await quizResultRepo.submitQuizResult(event.answerQueires);

      data.fold((l) {
        emit(SubmitQuizSuccess(submitQuizData: l));
      }, (r) => emit(SubmitQuizFailure(NetworkExceptions.getErrorMessage(r))));
    });
  }
}