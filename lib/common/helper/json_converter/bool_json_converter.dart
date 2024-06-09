import 'package:json_annotation/json_annotation.dart';

final class BoolOrIntOrStringToBoolConverter
    implements JsonConverter<bool?, dynamic> {
  const BoolOrIntOrStringToBoolConverter();

  @override
  bool? fromJson(dynamic json) {
    if (json == null) {
      return null;
    } else if (json is bool) {
      return json;
    } else if (json is num) {
      return json.ceil() != 0;
    } else if (json is String) {
      return json.toLowerCase() != 'false' &&
          json.toLowerCase() != '0' &&
          json.isNotEmpty;
    }
    return null;
  }

  @override
  dynamic toJson(bool? object) {
    return object;
  }
}
