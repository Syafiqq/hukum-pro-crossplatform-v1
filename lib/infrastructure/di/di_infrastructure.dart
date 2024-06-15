import 'package:hukum_pro/infrastructure/di/di.dart';
import 'package:hukum_pro/infrastructure/di/di_firebase.dart';
import 'package:hukum_pro/infrastructure/di/di_firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiInfrastructure {
  static void setup() {
    DiFirebase.setup();
    DiFirebaseService.setup();
    di.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  }
}
