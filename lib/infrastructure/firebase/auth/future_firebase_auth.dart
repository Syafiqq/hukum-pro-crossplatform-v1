import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';
import 'package:hukum_pro/infrastructure/firebase/auth/firebase_user_auth_service.dart';
import 'package:retry/retry.dart';

extension FutureFirebaseAuth on Future {
  static Future ensureFirebaseIsAuthenticated(
    FutureOr Function() fn, {
    bool forceAuthenticated = false,
  }) async {
    return retry(
      () async {
        await _handleFirebaseAuthentication(forceAuthenticated);
        return await fn();
      },
      maxAttempts: 2,
      retryIf: (e) {
        return e is FirebaseException &&
            (e.code == 'user-mismatch' || e.code == 'permission-denied');
      },
      onRetry: (_) => _handleFirebaseAuthentication(true),
    );
  }

  static Future _handleFirebaseAuthentication(bool forceAuthenticated) {
    return retry(
      () => di<FirebaseUserAuthService>().ensureUserIsAuthenticated(
        forceAuthenticated: forceAuthenticated,
      ),
      maxAttempts: 2,
    );
  }
}
