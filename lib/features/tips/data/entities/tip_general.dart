import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/features/tips/data/entities/tip.dart';

part 'tip_general.g.dart';

@JsonSerializable(explicitToJson: true)
class TipGeneral {
  Tip? getTipGeneral;

  TipGeneral({this.getTipGeneral});

  factory TipGeneral.fromJson(Map<String, dynamic> json) =>
      _$TipGeneralFromJson(json);

  Map<String, dynamic> toJson() => _$TipGeneralToJson(this);
}
