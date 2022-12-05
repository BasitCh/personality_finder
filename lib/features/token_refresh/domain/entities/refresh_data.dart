import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/core/global/const.dart';

part 'refresh_data.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class RefreshData extends Equatable {
  RefreshTokenGeneral? refreshTokenGeneral;
  RefreshData({
    this.refreshTokenGeneral,
  });

  factory RefreshData.fromJson(Json json) => _$RefreshDataFromJson(json);

  Json? toJson() => _$RefreshDataToJson(this);
  @override
  List<Object?> get props => [refreshTokenGeneral];
}

@JsonSerializable()
class RefreshTokenGeneral extends Equatable {
  final int? expiresIn;
  final String token;
  const RefreshTokenGeneral({
    required this.token,
    this.expiresIn,
  });

  factory RefreshTokenGeneral.fromJson(Json json) =>
      _$RefreshTokenGeneralFromJson(json);

  Json? toJson() => _$RefreshTokenGeneralToJson(this);

  @override
  // TODO: implement props
  @override
  List<Object?> get props => [expiresIn, token];
}
