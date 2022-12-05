import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/core/global/const.dart';
import 'package:morphosis_template/features/quiz_result_detail/domain/enties/quiz_result_response.dart';

part 'quiz_result_data.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class QuizResultData extends Equatable {
  GetResultContentGeneral? getResultContentGeneral;
  QuizResultData({this.getResultContentGeneral});
  factory QuizResultData.fromJson(Json json) => _$QuizResultDataFromJson(json);

  Json? toJson() => _$QuizResultDataToJson(this);
  @override
  List<Object?> get props => [getResultContentGeneral];
}
