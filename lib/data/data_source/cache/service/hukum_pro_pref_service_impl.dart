import 'dart:async';

import 'package:hukum_pro/common/helper/future/future_throttled.dart';
import 'package:hukum_pro/data/data_source/cache/service/hukum_pro_pref_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class HukumProPrefServiceImpl implements HukumProPrefService {
  final Future<SharedPreferences> _futureInfrastructure;
  SharedPreferences? _readOnlyPrefs;

  final FutureThrottled<SharedPreferences> _fetcher =
      FutureThrottled<SharedPreferences>();

  FutureOr<SharedPreferences> get _infrastructure {
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

  HukumProPrefServiceImpl(this._futureInfrastructure);
}
