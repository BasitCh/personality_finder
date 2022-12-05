// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationInfo _$PaginationInfoFromJson(Map<String, dynamic> json) =>
    PaginationInfo(
      count: json['count'] as int?,
      from: json['from'] as int?,
      items: json['items'] as int?,
      page: json['page'] as int?,
      pageIn: json['pageIn'] as int?,
      pageNext: json['pageNext'] as int? ?? 0,
      pageLast: json['pageLast'] as int?,
      pages: json['pages'] as int?,
      prev: json['prev'] as int? ?? 0,
      to: json['to'] as int?,
    );

Map<String, dynamic> _$PaginationInfoToJson(PaginationInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'from': instance.from,
      'items': instance.items,
      'page': instance.page,
      'pageIn': instance.pageIn,
      'pageNext': instance.pageNext,
      'pageLast': instance.pageLast,
      'pages': instance.pages,
      'prev': instance.prev,
      'to': instance.to,
    };
