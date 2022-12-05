// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../../core/global/error/network_exceptions.dart';
import '../../domain/entities/quiz_data.dart';
import '../../domain/repositories/quiz_task_repo.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRepo quizRepo;
  QuizBloc({required this.quizRepo}) : super(QuizInitial()) {
    on<QuizFetch>((event, emit) async {
      emit(const QuizLoading());
      final data = await quizRepo.quizFetch();

      data.fold((l) {
        if (l.getQuizQuestionsList!.isNotEmpty) {
          emit(QuizFetchSuccess(quizData: l));
        }
      }, (r) => emit(QuizFetchFailure(NetworkExceptions.getErrorMessage(r))));
    });
  }
}
