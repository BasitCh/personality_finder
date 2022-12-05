// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';
import 'submit_quiz_response.dart';

part 'submit_data.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class SubmitQuizData extends Equatable {
  CalculateQuizResult? calculateQuizResult;
  SubmitQuizData({this.calculateQuizResult});
  factory SubmitQuizData.fromJson(Json json) => _$SubmitQuizDataFromJson(json);

  Json? toJson() => _$SubmitQuizDataToJson(this);
  @override
  List<Object?> get props => [calculateQuizResult];
}
