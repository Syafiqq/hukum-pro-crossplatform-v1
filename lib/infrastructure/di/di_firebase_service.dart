import 'package:hukum_pro/infrastructure/di/di.dart';
import 'package:hukum_pro/infrastructure/firebase/auth/firebase_user_auth_service.dart';
import 'package:hukum_pro/infrastructure/firebase/auth/firebase_user_monitor_service.dart';

class DiFirebaseService {
  static void setup() {
    di.registerLazySingleton<FirebaseUserMonitorService>(
      () => FirebaseUserMonitorServiceImpl(di()),
    );
    di.registerLazySingleton<FirebaseUserAuthService>(
      () => FirebaseUserAuthServiceImpl(
        di(),
        di(),
      ),
    );
  }
}
