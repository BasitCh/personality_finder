import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:morphosis_template/core/global/const.dart';

part 'quiz_result_response.g.dart';

@JsonSerializable()
class QuizResultResponse extends Equatable {
  final GetResultContentGeneral getResultContentGeneral;

  const QuizResultResponse({
    required this.getResultContentGeneral,
  });

  factory QuizResultResponse.fromJson(Json json) =>
      _$QuizResultResponseFromJson(json);

  Json toJson() => _$QuizResultResponseToJson(this);

  @override
  List<Object?> get props => [getResultContentGeneral];
}
@JsonSerializable()
@immutable
class GetResultContentGeneral extends Equatable {
  final String id;
  final String category;
  final String boldDescription;
  final String personalityType;
  final String colorCode;
  final String description;
  final String imageUrl;
  final String title;
  final dynamic userFeedback;
  const GetResultContentGeneral({
    required this.id,
    required this.category,
    required this.boldDescription,
    required this.personalityType,
    required this.colorCode,
    required this.description,
    required this.imageUrl,
    required this.title,
    required this.userFeedback
  });
  

  factory GetResultContentGeneral.fromJson(Json json) =>
      _$GetResultContentGeneralFromJson(json);

  Json? toJson() => _$GetResultContentGeneralToJson(this);

  @override
  List<Object?> get props => [ id, category,boldDescription,personalityType,colorCode,description,imageUrl,title];
}
