import 'package:dartz/dartz.dart';
import 'package:morphosis_template/features/feedback/domain/entities/feedback_response.dart';
import 'package:morphosis_template/features/feedback/domain/entities/tip_feedback_response.dart';

// ignore: one_member_abstracts
abstract class FeedbackService {
  Future<Either<FeedbackResponse, Exception>> giveFeedback(
      {required int id, required bool useful});

  Future<Either<TipFeedBackResponse, Exception>> submitTipFeedback(
      {required int id, required bool useful});
}
