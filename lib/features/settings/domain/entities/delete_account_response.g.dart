// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAccountResponse _$DeleteAccountResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteAccountResponse(
      deleteMyAccount: json['deleteMyAccount'] == null
          ? null
          : ForgotPasswordGeneral.fromJson(
              json['deleteMyAccount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteAccountResponseToJson(
        DeleteAccountResponse instance) =>
    <String, dynamic>{
      'deleteMyAccount': instance.deleteMyAccount,
    };
