import 'dart:async';

import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// region interface

abstract class FirebaseUserMonitorService extends ChangeNotifier {
  User? get user;

  void start() {}

  void stop() {}
}

// endregion interface

// region implementation

final class FirebaseUserMonitorServiceImpl //
    extends ChangeNotifier implements FirebaseUserMonitorService {
  final FirebaseAuth _infrastructure;

  User? _user;

  StreamSubscription<User?>? _disposable;

  @override
  User? get user => _infrastructure.currentUser;

  FirebaseUserMonitorServiceImpl(this._infrastructure) {
    _user = _infrastructure.currentUser;
  }

  @override
  void start() {
    _removeCurrentStream();
    _createStream();
  }

  @override
  void stop() {
    _removeCurrentStream();
  }

  void _onUserChanged(User? user) {
    final shouldNotify = _user?.uid != user?.uid ||
        _user?.refreshToken != user?.refreshToken ||
        _user?.metadata.lastSignInTime != user?.metadata.lastSignInTime;

    _user = user;

    if (shouldNotify) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _removeCurrentStream();
    super.dispose();
  }
}

extension FirebaseUserMonitorServicePrivate on FirebaseUserMonitorServiceImpl {
  void _removeCurrentStream() {
    _disposable?.cancel();
    _disposable = null;
  }

  void _createStream() {
    final mergedStream = StreamGroup.merge(
      [
        _infrastructure.authStateChanges(),
        _infrastructure.idTokenChanges(),
        _infrastructure.authStateChanges(),
      ],
    );

    final disposable = mergedStream.listen(_onUserChanged);
    _disposable = disposable;
  }
}
// endregion implementation
