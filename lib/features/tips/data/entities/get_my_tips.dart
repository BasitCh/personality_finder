import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/features/tips/data/entities/pagination_info.dart';
import 'package:morphosis_template/features/tips/data/entities/tip.dart';

part 'get_my_tips.g.dart';

@JsonSerializable(explicitToJson: true)
class GetMyTips {
  PaginationInfo? paginationInfo;
  List<Tip>? tips;

  GetMyTips({this.paginationInfo, this.tips});

  factory GetMyTips.fromJson(Map<String, dynamic> json) =>
      _$GetMyTipsFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyTipsToJson(this);
}
