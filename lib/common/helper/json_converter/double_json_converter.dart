import 'package:freezed_annotation/freezed_annotation.dart';

final class NumOrStringToDoubleConverter
    implements JsonConverter<double?, dynamic> {
  const NumOrStringToDoubleConverter();

  @override
  double? fromJson(dynamic json) {
    if (json == null) {
      return null;
    } else if (json is String) {
      return double.parse(json);
    } else if (json is num) {
      return json.toDouble();
    }
    return null;
  }

  @override
  dynamic toJson(double? object) {
    return object;
  }
}
