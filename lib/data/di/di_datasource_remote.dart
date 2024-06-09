import 'package:hukum_pro/data/data_source/remote/impl/hukum_pro_remote_data_source.dart';
import 'package:hukum_pro/data/data_source/remote/impl/hukum_pro_remote_data_source_impl.dart';
import 'package:hukum_pro/data/data_source/remote/service/hukum_pro_firebase_service.dart';
import 'package:hukum_pro/data/data_source/remote/service/hukum_pro_firebase_service_impl.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';

class DiFirebase {
  static void setup() {
    di.registerLazySingleton<HukumProFirebaseService>(
      () => HukumProFirebaseServiceImpl(di()),
    );
    di.registerLazySingleton<HukumProRemoteDataSource>(
      () => HukumProRemoteDataSourceImpl(di()),
    );
  }
}
