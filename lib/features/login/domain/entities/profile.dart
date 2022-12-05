// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/features/quiz_result/domain/enties/submit_quiz_response.dart';

// Project imports:
import '../../../../core/global/util/app_constants.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Profile {
  dynamic id;
  String? firstName;
  String? lastName;
  String? imageUrl;
  @JsonKey(name: 'locale')
  String? locale;
  bool? notificationEnabled;
  int? yearOfBirth;
  Gender? gender;
  @JsonKey(defaultValue: false)
  bool takenQuiz;
  bool? quizForceRetake;
  CalculateQuizResult? quizResult;

  Profile(
      {required this.id,
      required this.takenQuiz,
      this.notificationEnabled,
      this.firstName,
      this.lastName,
      this.yearOfBirth,
      this.gender,
      this.imageUrl,
      this.locale,
      this.quizResult,
      this.quizForceRetake});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
