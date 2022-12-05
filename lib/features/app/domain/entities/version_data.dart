// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';

part 'version_data.g.dart';

@JsonSerializable(explicitToJson: true)
class VersionData extends Equatable {
  final int androidMiniVersionCode;

  final int androidLatestVersionCode;

  final int iosMiniVersionCode;

  final int iosLatestVersionCode;

  final List<String>? changeLog;

  const VersionData({
    required this.androidMiniVersionCode,
    required this.androidLatestVersionCode,
    required this.iosMiniVersionCode,
    required this.iosLatestVersionCode,
    this.changeLog,
  });

  factory VersionData.fromJson(Json json) => _$VersionDataFromJson(json);

  Json toJson() => _$VersionDataToJson(this);

  @override
  List<Object?> get props => [
        androidMiniVersionCode,
        androidLatestVersionCode,
        iosMiniVersionCode,
        iosLatestVersionCode,
        changeLog,
      ];
}
