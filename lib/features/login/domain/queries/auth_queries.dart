// Project imports:
import '../../../../core/global/util/app_constants.dart';
import '../entities/profile.dart';

class AuthQueries {
  static String loginQuery(String email, String password, String? platform,
      String? registrationID, String? uuid) {
    return '''
    mutation {
      loginGeneral(
        email: "$email",
        password: "$password",
        device: {
          platform: $platform,
          registrationId: "$registrationID",
          uuid: "$uuid"
        },
      ) {
        token
        expiresIn
      }
    }
''';
  }

  static String registerQuery(
      {required String email,
      required String password,
      required String companyCode,
      required String firstName,
      required String lastName,
      required int yearOfBirth,
      required Gender gender,
      String? image,
      String? platform,
      String? registrationID,
      String? uuid}) {
    if (image != null && image.isNotEmpty) {
      return '''
    mutation {
      registerGeneral(
        email: "$email",
        password: "$password",
        companyCode: "$companyCode",
        firstName: "$firstName",
        lastName: "$lastName",
        yearOfBirth: $yearOfBirth,
        gender: ${gender.name}
        image: "$image"
        device: {
           platform: $platform,
          registrationId: "$registrationID",
          uuid: "$uuid"
        },
      ) {
        token
        expiresIn
      }
    }
''';
    } else {
      return '''
    mutation {
      registerGeneral(
        email: "$email",
        password: "$password",
        companyCode: "$companyCode",
        firstName: "$firstName",
        lastName: "$lastName",
        yearOfBirth: $yearOfBirth,
        gender: ${gender.name}
        image: $image
        device: {
           platform: $platform,
          registrationId: "$registrationID",
          uuid: "$uuid"
        },
      ) {
        token
        expiresIn
      }
    }
''';
    }
  }

  static String getUserDetailsQuery() {
    return '''
    {
	getMyUserDetails {
		id
		email
		awarenessScore
		anonymized
		company{
			name
			companyCode
		}
		profile {
			id
			firstName
			lastName
			gender
			imageUrl
			locale
      yearOfBirth
			notificationEnabled
			takenQuiz
			quizForceRetake
			quizResult{
				chronotype{
					id
					personalityType
					colorCode
					category
					title
					description
          imageUrl
          iconUrl
				}
				psychotype{
					primaryTrait{
						colorCode
						personalityType
						category
						id
						title
						description
            imageUrl
            iconUrl
					}
					secondaryTrait{
						colorCode
						personalityType
						category
						id
						title
						description
            imageUrl
            iconUrl
					}
				}
			}
		}
	}
}
''';
  }

  static String forgetPasswordQuery({
    required String email,
  }) {
    return '''
        mutation {
          forgotPasswordGeneral(
            email: "$email",
          ) {
            status
          },
    }
''';
  }

  static String resetPasswordQuery(
      {required String password, required String token}) {
    return '''
      mutation {
        resetPasswordGeneral(
          token: "$token",
          password: "$password"
        ) {
          status
        },
    }
''';
  }

  static String updatePasswordQuery(
      {required String oldPassword, required String newPassword}) {
    return '''
    mutation {
      changePasswordGeneral(
        oldPassword: "$oldPassword"
        newPassword: "$newPassword"
      ) {
        status
      }
    }
''';
  }

  static String deleteAccount() {
    return '''
    mutation {
      deleteMyAccount {status}
    }
''';
  }

  static String signOut() {
    return '''
   mutation {
	logoutGeneral{
		status
	}
}
''';
  }

  static String updateProfileQuery({required Profile profile}) {
    if (profile.imageUrl != null && profile.imageUrl!.isNotEmpty) {
      return '''
        mutation {
          updateProfile(
            firstName: "${profile.firstName}",
            lastName:  "${profile.lastName}"
            yearOfBirth:  ${profile.yearOfBirth},
            gender: ${profile.gender!.name}
            image:  "${profile.imageUrl}"
          ) {
            firstName
            lastName
            imageUrl
            yearOfBirth
            locale
            notificationEnabled
            gender
          }
        },
''';
    } else {
      return '''
        mutation {
          updateProfile(
            firstName: "${profile.firstName}",
            lastName:  "${profile.lastName}"
            yearOfBirth:  ${profile.yearOfBirth},
            gender: ${profile.gender!.name}
          ) {
            firstName
            lastName
            imageUrl
            yearOfBirth
            locale
            notificationEnabled
            gender
          }
        },
''';
    }
  }

  static String updateLocaleQuery({required Locale locale}) {
    return '''
        mutation {
          updateProfile(
            locale: ${locale.name}
          ) {
            firstName
            lastName
            imageUrl
            yearOfBirth
            locale
            notificationEnabled
            gender
          }
        },
''';
  }

  static String uploadDocumentQuery(
      {required String filename,
      required int byteSize,
      required String checksum,
      required String contentType}) {
    return '''
        mutation {
          createDirectUpload(
          filename: "$filename"
          byteSize: $byteSize
          checksum: "$checksum"
          contentType: "$contentType"
          ) {
            directUpload{
              headers
              url
            }
            signedId
          }
        },
      ''';
  }
}
