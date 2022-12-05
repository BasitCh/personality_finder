// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'],
      takenQuiz: json['takenQuiz'] as bool? ?? false,
      notificationEnabled: json['notificationEnabled'] as bool?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      yearOfBirth: json['yearOfBirth'] as int?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      imageUrl: json['imageUrl'] as String?,
      locale: json['locale'] as String?,
      quizResult: json['quizResult'] == null
          ? null
          : CalculateQuizResult.fromJson(
              json['quizResult'] as Map<String, dynamic>),
      quizForceRetake: json['quizForceRetake'] as bool?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('locale', instance.locale);
  writeNotNull('notificationEnabled', instance.notificationEnabled);
  writeNotNull('yearOfBirth', instance.yearOfBirth);
  writeNotNull('gender', _$GenderEnumMap[instance.gender]);
  val['takenQuiz'] = instance.takenQuiz;
  writeNotNull('quizForceRetake', instance.quizForceRetake);
  writeNotNull('quizResult', instance.quizResult?.toJson());
  return val;
}

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};
