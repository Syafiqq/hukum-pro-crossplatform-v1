import 'dart:async';

import 'package:hukum_pro/common/helper/future/future_throttled.dart';
import 'package:hukum_pro/data/data_source/local/service/hukum_pro_isar_service.dart';
import 'package:isar/isar.dart';

final class HukumProIsarServiceImpl implements HukumProIsarService {
  final Future<Isar> _futureInfrastructure;
  Isar? _readOnlyPrefs;

  final FutureThrottled<Isar> _fetcher = FutureThrottled<Isar>();

  FutureOr<Isar> get _infrastructure {
    return _readOnlyPrefs ??
        _fetcher.execute(
          _futureInfrastructure.then(
            (value) {
              _readOnlyPrefs = value;
              return value;
            },
          ),
        );
  }

  HukumProIsarServiceImpl(this._futureInfrastructure);
}
