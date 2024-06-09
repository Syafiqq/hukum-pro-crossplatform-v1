import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hukum_pro/infrastructure/firebase/auth/firebase_user_monitor_service.dart';

// region interface

abstract class FirebaseUserAuthService {
  Future<void> ensureUserIsAuthenticated({bool forceAuthenticated = false});
}

// endregion interface

// region implementation

final class FirebaseUserAuthServiceImpl implements FirebaseUserAuthService {
  final FirebaseAuth _infrastructure;
  final FirebaseUserMonitorService _monitorService;

  FirebaseUserAuthServiceImpl(
    this._infrastructure,
    this._monitorService,
  );

  @override
  Future<void> ensureUserIsAuthenticated({
    bool forceAuthenticated = false,
  }) async {
    if (_monitorService.user == null || forceAuthenticated) {
      await _infrastructure.signInAnonymously();
    }
  }
}
// endregion implementation
