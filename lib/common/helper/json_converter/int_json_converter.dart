import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hukum_pro/common/helper/util/util_parse_type.dart';

final class IntOrStringToIntConverter implements JsonConverter<int?, dynamic> {
  const IntOrStringToIntConverter();

  @override
  int? fromJson(dynamic json) {
    if (json == null) {
      return null;
    } else if (json is String) {
      return json.toInt();
    } else if (json is num) {
      return json.toInt();
    }
    return null;
  }

  @override
  dynamic toJson(int? object) {
    return object;
  }
}
