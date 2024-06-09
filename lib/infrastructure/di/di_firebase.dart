import 'package:firebase_auth/firebase_auth.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';

class DiFirebase {
  static void setup() {
    di.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  }
}
