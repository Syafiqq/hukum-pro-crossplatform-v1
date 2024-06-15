import 'package:hukum_pro/data/data_source/remote/service/hukum_pro_firebase_service.dart';
import 'package:hukum_pro/data/data_source/remote/service/hukum_pro_firebase_service_impl.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';

class DiDatasourceRemote {
  static void setup() {
    _setupRemoteService();
  }

  static void _setupRemoteService() {
    di.registerLazySingleton<HukumProFirebaseService>(
      () => HukumProFirebaseServiceImpl(di()),
    );
  }
}
