// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitQuizResponse _$SubmitQuizResponseFromJson(Map<String, dynamic> json) =>
    SubmitQuizResponse(
      calculateQuizResult: CalculateQuizResult.fromJson(
          json['calculateQuizResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitQuizResponseToJson(SubmitQuizResponse instance) =>
    <String, dynamic>{
      'calculateQuizResult': instance.calculateQuizResult,
    };

CalculateQuizResult _$CalculateQuizResultFromJson(Map<String, dynamic> json) =>
    CalculateQuizResult(
      chronotype: json['chronotype'] == null
          ? null
          : Chronotype.fromJson(json['chronotype'] as Map<String, dynamic>),
      psychotype: json['psychotype'] == null
          ? null
          : Psychotype.fromJson(json['psychotype'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CalculateQuizResultToJson(
        CalculateQuizResult instance) =>
    <String, dynamic>{
      'chronotype': instance.chronotype,
      'psychotype': instance.psychotype,
    };

Chronotype _$ChronotypeFromJson(Map<String, dynamic> json) => Chronotype(
      id: json['id'] as String?,
      colorCode: json['colorCode'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      personalityType: json['personalityType'] as String?,
      category: json['category'] as String?,
      iconUrl: json['iconUrl'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ChronotypeToJson(Chronotype instance) =>
    <String, dynamic>{
      'id': instance.id,
      'colorCode': instance.colorCode,
      'title': instance.title,
      'description': instance.description,
      'personalityType': instance.personalityType,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
      'iconUrl': instance.iconUrl,
    };

Psychotype _$PsychotypeFromJson(Map<String, dynamic> json) => Psychotype(
      primaryTrait: json['primaryTrait'] == null
          ? null
          : PrimaryTrait.fromJson(json['primaryTrait'] as Map<String, dynamic>),
      secondaryTrait: json['secondaryTrait'] == null
          ? null
          : SecondaryTrait.fromJson(
              json['secondaryTrait'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PsychotypeToJson(Psychotype instance) =>
    <String, dynamic>{
      'primaryTrait': instance.primaryTrait,
      'secondaryTrait': instance.secondaryTrait,
    };

PrimaryTrait _$PrimaryTraitFromJson(Map<String, dynamic> json) => PrimaryTrait(
      id: json['id'] as String?,
      colorCode: json['colorCode'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      personalityType: json['personalityType'] as String?,
      category: json['category'] as String?,
      iconUrl: json['iconUrl'] as String?,
      imageSignedId: json['imageSignedId'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$PrimaryTraitToJson(PrimaryTrait instance) =>
    <String, dynamic>{
      'id': instance.id,
      'colorCode': instance.colorCode,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'iconUrl': instance.iconUrl,
      'imageSignedId': instance.imageSignedId,
      'personalityType': instance.personalityType,
      'category': instance.category,
    };

SecondaryTrait _$SecondaryTraitFromJson(Map<String, dynamic> json) =>
    SecondaryTrait(
      id: json['id'] as String?,
      colorCode: json['colorCode'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      iconUrl: json['iconUrl'] as String?,
      imageSignedId: json['imageSignedId'] as String?,
      personalityType: json['personalityType'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$SecondaryTraitToJson(SecondaryTrait instance) =>
    <String, dynamic>{
      'id': instance.id,
      'colorCode': instance.colorCode,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'iconUrl': instance.iconUrl,
      'imageSignedId': instance.imageSignedId,
      'personalityType': instance.personalityType,
      'category': instance.category,
    };
