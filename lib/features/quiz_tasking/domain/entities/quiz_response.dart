// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';

part 'quiz_response.g.dart';

@JsonSerializable()
class QuizResponse extends Equatable {
  final List<GetQuizQuestions> getQuizQuestions;

  const QuizResponse({
    required this.getQuizQuestions,
  });

  factory QuizResponse.fromJson(Json json) => _$QuizResponseFromJson(json);

  Json toJson() => _$QuizResponseToJson(this);

  @override
  List<Object> get props => [
        getQuizQuestions,
      ];
}

@JsonSerializable()
class GetQuizQuestions extends Equatable {
  final String id;
  final String question;
  final int questionOrder;
  final List<QuizAnswers> quizAnswers;
  const GetQuizQuestions(
      {required this.id,
      required this.question,
      required this.questionOrder,
      required this.quizAnswers});

  factory GetQuizQuestions.fromJson(Json json) =>
      _$GetQuizQuestionsFromJson(json);

  Json? toJson() => _$GetQuizQuestionsToJson(this);

  @override
  List<Object?> get props => [
        question,
        questionOrder,
      ];

  @override
  String toString() =>
      'GetQuizQuestions(question: $question, questionOrder: $questionOrder)';
}

@JsonSerializable()
class QuizAnswers extends Equatable {
  final String? answer;
  final int? answerOrder;
  final String? id;
  final String? imageSignedId;
  final String? imageUrl;

  const QuizAnswers(
    this.answer,
    this.answerOrder,
    this.id,
    this.imageSignedId,
    this.imageUrl,
  );
  factory QuizAnswers.fromJson(Json json) => _$QuizAnswersFromJson(json);

  Json? toJson() => _$QuizAnswersToJson(this);

  @override
  List<Object?> get props => [
        answer,
        answerOrder,
        id,
        imageSignedId,
        imageUrl,
      ];

  @override
  String toString() {
    return 'QuizAnswers(answer: $answer, answerOrder: $answerOrder, id: $id, imageSignedId: $imageSignedId, imageUrl: $imageUrl, )';
  }
}
