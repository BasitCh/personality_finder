import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/core/global/util/feedback/feedback_service/feedback_service.dart';
import 'package:morphosis_template/core/global/util/feedback/feedback_upload/feedback_give.dart';
import 'package:morphosis_template/features/feedback/domain/entities/feedback_response.dart';
import 'package:morphosis_template/features/feedback/domain/entities/tip_feedback_response.dart';

@LazySingleton()
class FeedbackRepo {
  late FeedbackService feedbackService;

  Future<Either<FeedbackResponse, NetworkExceptions>> submitFeedback(
      {required int id, required bool usefulStatus}) async {
    try {
      feedbackService = FeedbackGive();
      try {
        final response =
            await feedbackService.giveFeedback(id: id, useful: usefulStatus);

        return await response.fold((data) async {
          return left(data);
        }, (error) {
          return right(NetworkExceptions.defaultError(error.toString()));
        });
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<TipFeedBackResponse, NetworkExceptions>> submitTipFeedback(
      {required int id, required bool usefulStatus}) async {
    try {
      feedbackService = FeedbackGive();
      try {
        final response = await feedbackService.submitTipFeedback(
            id: id, useful: usefulStatus);

        return await response.fold((data) async {
          return left(data);
        }, (error) {
          return right(NetworkExceptions.defaultError(error.toString()));
        });
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}
