
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:morphosis_template/features/tip_questions/data/entities/submit_answer_request.dart';
import 'package:morphosis_template/features/tip_questions/data/repositories/tip_question_repo.dart';

part 'tip_question_event.dart';

part 'tip_question_state.dart';

class TipQuestionBloc extends Bloc<TipQuestionEvent, TipQuestionState> {
  final TipQuestionRepo tipQuestionRepo;

  TipQuestionBloc({required this.tipQuestionRepo})
      : super(TipQuestionInitial()) {
    on<InitialTipEvent>((event, emit) {
      emit(TipQuestionInitial());
    });

    on<AnswerTipQuestion>((event, emit) async {
      emit(SubmittingAnswer());
      final data = await tipQuestionRepo.submitTipQuestionAnswer(
          submitAnswerRequest: event.submitAnswerRequest);

      data.fold((l) {
        if (l) {
          emit(AnswerSubmitted());
        }
      }, (r) => emit(FailedSubmittingAnswer(error: r.toString())));
    });
  }
}
