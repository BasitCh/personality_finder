// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';
import 'quiz_response.dart';

part 'quiz_data.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class QuizData extends Equatable {
  List<GetQuizQuestions>? getQuizQuestionsList;
  QuizData({this.getQuizQuestionsList});
  factory QuizData.fromJson(Json json) => _$QuizDataFromJson(json);

  Json? toJson() => _$QuizDataToJson(this);

  @override
  List<Object?> get props => [getQuizQuestionsList];
}
