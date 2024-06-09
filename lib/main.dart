import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hukum_pro/di.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';
import 'package:hukum_pro/infrastructure/firebase/auth/firebase_user_monitor_service.dart';
import 'package:hukum_pro/infrastructure/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // DI
  Di.setup();

  // Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Firebase Auth
  di<FirebaseUserMonitorService>().start();
}
