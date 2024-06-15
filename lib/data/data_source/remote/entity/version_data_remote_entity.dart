import 'package:hukum_pro/common/helper/json_converter/int_json_converter.dart';
import 'package:hukum_pro/common/helper/json_converter/string_json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_data_remote_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, anyMap: true)
final class VersionDataRemoteEntity {
  @StringOrIntToStringConverter()
  final String? id;

  @IntOrStringToIntConverter()
  final int? milis;

  @IntOrStringToIntConverter()
  final int? version;

  final String? timestamp;

  final VersionDetailDataRemoteEntity? detail;

  VersionDataRemoteEntity({
    this.id,
    this.milis,
    this.version,
    this.timestamp,
    this.detail,
  });

  factory VersionDataRemoteEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$VersionDataRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VersionDataRemoteEntityToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, anyMap: true)
final class VersionDetailDataRemoteEntity {
  @JsonKey(defaultValue: [])
  final List<String> lawFilenames;

  @JsonKey(defaultValue: [])
  final List<VersionOrderDataRemoteEntity> orders;

  VersionDetailDataRemoteEntity({
    required this.lawFilenames,
    required this.orders,
  });

  factory VersionDetailDataRemoteEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$VersionDetailDataRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VersionDetailDataRemoteEntityToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, anyMap: true)
final class VersionOrderDataRemoteEntity {
  @StringOrIntToStringConverter()
  final String? id;

  @IntOrStringToIntConverter()
  final int? order;

  final String? name;

  VersionOrderDataRemoteEntity({
    this.id,
    this.order,
    this.name,
  });

  factory VersionOrderDataRemoteEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$VersionOrderDataRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VersionOrderDataRemoteEntityToJson(this);
}
