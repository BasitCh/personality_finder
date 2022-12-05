import 'package:json_annotation/json_annotation.dart';

part 'pagination_info.g.dart';

@JsonSerializable(explicitToJson: true)
class PaginationInfo {
  int? count;
  int? from;
  int? items;
  int? page;
  int? pageIn;
  @JsonKey(defaultValue: 0)
  int? pageNext;
  int? pageLast;
  int? pages;
  @JsonKey(defaultValue: 0)
  int? prev;
  int? to;

  PaginationInfo(
      {this.count,
      this.from,
      this.items,
      this.page,
      this.pageIn,
      this.pageNext,
      this.pageLast,
      this.pages,
      this.prev,
      this.to});

  factory PaginationInfo.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationInfoToJson(this);
}
