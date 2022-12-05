// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:morphosis_template/features/feedback/domain/entities/feedback_response.dart';
import 'package:morphosis_template/features/feedback/domain/repositories/feedback_repo.dart';

// Project imports:
import '../../../../core/global/error/network_exceptions.dart';

part 'feedback_event.dart';

part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final FeedbackRepo feedbackRepo;

  FeedbackBloc({required this.feedbackRepo}) : super(FeedbackInitial()) {
    on<FeedbackGive>((event, emit) async {
      emit(FeedbackInitial());
      final data = await feedbackRepo.submitFeedback(
          id: event.id, usefulStatus: event.feedbackStatus);

      data.fold((l) {
        emit(FeedbackGiveSuccess(
            feedbackQuizResultContent: l.feedbackQuizResultContent!));
      },
          (r) =>
              emit(FeedbackGiveFailure(NetworkExceptions.getErrorMessage(r))));
    });

    on<SubmitTipFeedback>((event, emit) async {
      emit(FeedbackInitial());
      final data = await feedbackRepo.submitTipFeedback(
          id: event.id, usefulStatus: event.feedbackStatus);

      data.fold((l) {
        emit(TipFeedbackSubmitted(feedbackTip: l.feedbackTip!));
      },
          (r) => emit(TipFeedbackFailure(
              failure: NetworkExceptions.getErrorMessage(r))));
    });
  }
}
