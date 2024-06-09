import 'package:hukum_pro/infrastructure/di/di_firebase.dart';
import 'package:hukum_pro/infrastructure/di/di_firebase_service.dart';

class DiInfrastructure {
  static void setup() {
    DiFirebase.setup();
    DiFirebaseService.setup();
  }
}
