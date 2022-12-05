import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/features/tips/data/entities/get_my_tips.dart';

part 'tip_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TipResponse {
  GetMyTips? getMyTips;

  TipResponse({this.getMyTips});

  factory TipResponse.fromJson(Map<String, dynamic> json) =>
      _$TipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TipResponseToJson(this);
}
