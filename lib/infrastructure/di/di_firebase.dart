import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';

class DiFirebase {
  static void setup() {
    di.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    di.registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabase.instance);
  }
}
