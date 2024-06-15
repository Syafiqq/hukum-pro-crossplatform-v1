import 'dart:async';
import 'dart:convert';

import 'package:hukum_pro/common/helper/future/future_throttled.dart';
import 'package:hukum_pro/data/data_source/cache/entity/version_data_cache_entity.dart';
import 'package:hukum_pro/data/data_source/cache/service/hukum_pro_pref_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  dataVersion;

  // convert enum to string
  String get name {
    switch (this) {
      case _Key.dataVersion:
        return 'data_version';
    }
  }
}

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

  @override
  Future<VersionDataCacheEntity?> getVersion() async {
    final service = await _infrastructure;
    final versionRaw = service.getString(_Key.dataVersion.name);
    if (versionRaw == null) {
      return null;
    }
    final versionMap = jsonDecode(versionRaw) as Map<String, dynamic>;
    return VersionDataCacheEntity.fromJson(versionMap);
  }

  @override
  Future<void> setVersion(VersionDataCacheEntity version) async {
    final service = await _infrastructure;
    final versionString = jsonEncode(version.toJson());
    await service.setString(_Key.dataVersion.name, versionString);
  }
}
