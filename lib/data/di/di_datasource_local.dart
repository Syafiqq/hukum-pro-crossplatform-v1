import 'package:hukum_pro/data/data_source/local/service/hukum_pro_path_service.dart';
import 'package:hukum_pro/data/data_source/local/service/hukum_pro_path_service_impl.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';

class DiDatasourceLocal {
  static void setup() {
    _setupService();
  }

  static void _setupService() {
    di.registerLazySingleton<HukumProPathService>(
      () => HukumProPathServiceImpl(),
    );
  }
}
