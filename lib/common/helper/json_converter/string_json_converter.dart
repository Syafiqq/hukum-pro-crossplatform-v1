import 'package:json_annotation/json_annotation.dart';

final class StringOrIntToStringConverter
    implements JsonConverter<String?, dynamic> {
  const StringOrIntToStringConverter();

  @override
  String? fromJson(dynamic json) {
    if (json == null) {
      return null;
    } else if (json is String) {
      return json;
    } else if (json is num) {
      return json.toString();
    }
    return null;
  }

  @override
  dynamic toJson(String? object) {
    return object;
  }
}
