import 'package:hukum_pro/data/data_source/cache/entity/version_data_cache_entity.dart';
import 'package:hukum_pro/data/data_source/cache/impl/hukum_pro_cache_data_source.dart';
import 'package:hukum_pro/data/data_source/cache/service/hukum_pro_pref_service.dart';

final class HukumProCacheDataSourceImpl implements HukumProCacheDataSource {
  final HukumProPrefService _sharedPreference;

  HukumProCacheDataSourceImpl(this._sharedPreference);

  @override
  Future<VersionDataCacheEntity?> getVersion() =>
      _sharedPreference.getVersion();

  @override
  Future<void> setVersion(VersionDataCacheEntity version) =>
      _sharedPreference.setVersion(version);
}
