// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  String? name;
  @JsonKey(name: 'companyCode')
  String? companyCode;

  Company({this.name, this.companyCode});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
