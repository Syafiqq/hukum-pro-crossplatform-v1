import 'package:hukum_pro/data/data_source/cache/impl/hukum_pro_cache_data_source.dart';
import 'package:hukum_pro/data/data_source/cache/impl/hukum_pro_cache_data_source_impl.dart';
import 'package:hukum_pro/data/data_source/cache/service/hukum_pro_pref_service.dart';
import 'package:hukum_pro/data/data_source/cache/service/hukum_pro_pref_service_impl.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';

class DiDatasourceCache {
  static void setup() {
    _setupService();
    _setupDataSource();
  }

  static void _setupService() {
    di.registerLazySingleton<HukumProPrefService>(
      () => HukumProPrefServiceImpl(di()),
    );
  }

  static void _setupDataSource() {
    di.registerLazySingleton<HukumProCacheDataSource>(
      () => HukumProCacheDataSourceImpl(di()),
    );
  }
}
