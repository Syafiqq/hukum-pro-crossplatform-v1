import 'package:hukum_pro/data/data_source/cache/service/hukum_pro_pref_service.dart';
import 'package:hukum_pro/data/data_source/cache/service/hukum_pro_pref_service_impl.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';

class DiDatasourceCache {
  static void setup() {
    _setupService();
  }

  static void _setupService() {
    di.registerLazySingleton<HukumProPrefService>(
      () => HukumProPrefServiceImpl(di.getAsync()),
    );
  }
}
