import 'package:hukum_pro/data/data_source/cache/entity/version_data_cache_entity.dart';

abstract interface class HukumProPrefService {
  Future<VersionDataCacheEntity?> getVersion();

  Future<void> setVersion(VersionDataCacheEntity version);
}
