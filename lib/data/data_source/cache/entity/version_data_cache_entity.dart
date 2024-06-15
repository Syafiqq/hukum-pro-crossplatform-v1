import 'package:hukum_pro/common/helper/json_converter/int_json_converter.dart';
import 'package:hukum_pro/common/helper/json_converter/string_json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_data_cache_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class VersionDataCacheEntity {
  @StringOrIntToStringConverter()
  final String? id;

  @IntOrStringToIntConverter()
  final int? milis;

  @IntOrStringToIntConverter()
  final int? version;

  final String? timestamp;

  VersionDataCacheEntity({
    this.id,
    this.milis,
    this.version,
    this.timestamp,
  });

  factory VersionDataCacheEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$VersionDataCacheEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VersionDataCacheEntityToJson(this);
}
