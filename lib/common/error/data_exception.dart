import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hukum_pro/common/error/runtime_exception.dart';

part 'data_exception.freezed.dart';

@freezed
sealed class DataException implements _$DataException {
  @Implements<RuntimeException>()
  const factory DataException.noData({
    @Default('Data not found') String message,
    @Default(null) String? code,
    @Default(null) Exception? internalException,
  }) = NoDataException;
}
