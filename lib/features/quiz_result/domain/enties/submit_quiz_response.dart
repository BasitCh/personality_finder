// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/core/global/const.dart';
part 'submit_quiz_response.g.dart';

@JsonSerializable()
class SubmitQuizResponse extends Equatable {
  final CalculateQuizResult calculateQuizResult;

  const SubmitQuizResponse({
    required this.calculateQuizResult,
  });

  factory SubmitQuizResponse.fromJson(Json json) =>
      _$SubmitQuizResponseFromJson(json);

  Json toJson() => _$SubmitQuizResponseToJson(this);

  @override
  List<Object?> get props => [calculateQuizResult];
}

@JsonSerializable()
@immutable
class CalculateQuizResult extends Equatable {
  final Chronotype? chronotype;
  final Psychotype? psychotype;
  const CalculateQuizResult({
    this.chronotype,
    this.psychotype,
  });

  factory CalculateQuizResult.fromJson(Json json) =>
      _$CalculateQuizResultFromJson(json);

  Json? toJson() => _$CalculateQuizResultToJson(this);

  @override
  List<Object?> get props => [chronotype, psychotype];
}

@JsonSerializable()
@immutable
class Chronotype extends Equatable {
  final String? id;
  final String? colorCode;
  final String? title;
  final String? description;
  final String? personalityType;
  final String? category;
  final String? imageUrl;
  final String? iconUrl;

  const Chronotype(
      {this.id,
      this.colorCode,
      this.title,
      this.description,
      this.personalityType,
      this.category,
      this.iconUrl,
      this.imageUrl});

  factory Chronotype.fromJson(Json json) => _$ChronotypeFromJson(json);

  Json? toJson() => _$ChronotypeToJson(this);

  @override
  List<Object?> get props => [id, colorCode, title, description];
}

@JsonSerializable()
@immutable
class Psychotype extends Equatable {
  final PrimaryTrait? primaryTrait;
  final SecondaryTrait? secondaryTrait;
  const Psychotype({required this.primaryTrait, required this.secondaryTrait});

  factory Psychotype.fromJson(Json json) => _$PsychotypeFromJson(json);

  Json? toJson() => _$PsychotypeToJson(this);

  @override
  List<Object?> get props => [primaryTrait];
}

@JsonSerializable()
class PrimaryTrait extends Equatable {
  final String? id;
  final String? colorCode;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? iconUrl;
  final String? imageSignedId;
  final String? personalityType;
  final String? category;

  const PrimaryTrait(
      {this.id,
      this.colorCode,
      this.title,
      this.description,
      this.personalityType,
      this.category,
      this.iconUrl,
      this.imageSignedId,
      this.imageUrl});

  factory PrimaryTrait.fromJson(Json json) => _$PrimaryTraitFromJson(json);

  Json? toJson() => _$PrimaryTraitToJson(this);

  @override
  List<Object?> get props => [
        id,
        colorCode,
        title,
        description,
        imageUrl,
        iconUrl,
        imageSignedId,
        personalityType,
        category
      ];
}

@JsonSerializable()
class SecondaryTrait extends Equatable {
  final String? id;
  final String? colorCode;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? iconUrl;

  final String? imageSignedId;
  final String? personalityType;
  final String? category;

  const SecondaryTrait(
      {this.id,
      this.colorCode,
      this.title,
      this.description,
      this.imageUrl,
      this.iconUrl,
      this.imageSignedId,
      this.personalityType,
      this.category});

  factory SecondaryTrait.fromJson(Json json) => _$SecondaryTraitFromJson(json);

  Json? toJson() => _$SecondaryTraitToJson(this);

  @override
  List<Object?> get props => [
        id,
        colorCode,
        title,
        description,
        imageUrl,
        iconUrl,
        imageSignedId,
        personalityType,
        category
      ];
}
