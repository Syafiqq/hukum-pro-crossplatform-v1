import 'package:hukum_pro/common/helper/json_converter/int_json_converter.dart';
import 'package:hukum_pro/common/helper/json_converter/string_json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_data_remote_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class VersionDataRemoteEntity {
  @IntOrStringToIntConverter()
  final int? milis;

  @StringOrIntToStringConverter()
  final String? timestamp;

  VersionDataRemoteEntity({
    this.milis,
    this.timestamp,
  });

  factory VersionDataRemoteEntity.fromJson(Map<String, dynamic> json) =>
      _$VersionDataRemoteEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VersionDataRemoteEntityToJson(this);
}
