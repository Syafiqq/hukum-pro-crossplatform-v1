import 'package:hukum_pro/infrastructure/di/di.dart';
import 'package:hukum_pro/infrastructure/firebase/auth/firebase_user_monitor_service.dart';

class DiFirebaseService {
  static void setup() {
    di.registerLazySingleton<FirebaseUserMonitorService>(
      () => FirebaseUserMonitorServiceImpl(di()),
    );
  }
}
