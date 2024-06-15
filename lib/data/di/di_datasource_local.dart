import 'package:hukum_pro/data/data_source/local/impl/hukum_pro_local_data_source.dart';
import 'package:hukum_pro/data/data_source/local/impl/hukum_pro_local_data_source_impl.dart';
import 'package:hukum_pro/data/data_source/local/service/hukum_pro_isar_service.dart';
import 'package:hukum_pro/data/data_source/local/service/hukum_pro_isar_service_impl.dart';
import 'package:hukum_pro/data/data_source/local/service/hukum_pro_path_service.dart';
import 'package:hukum_pro/data/data_source/local/service/hukum_pro_path_service_impl.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';

class DiDatasourceLocal {
  static void setup() {
    _setupService();
    _setupDataSource();
  }

  static void _setupService() {
    di.registerLazySingleton<HukumProPathService>(
      () => HukumProPathServiceImpl(),
    );
    di.registerLazySingleton<HukumProIsarService>(
      () => HukumProIsarServiceImpl(
        di.getAsync(),
      ),
    );
  }

  static void _setupDataSource() {
    di.registerLazySingleton<HukumProLocalDataSource>(
      () => HukumProLocalDataSourceImpl(di()),
    );
  }
}
