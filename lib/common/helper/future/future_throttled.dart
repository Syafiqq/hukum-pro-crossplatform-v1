import 'dart:async';

import 'package:synchronized/synchronized.dart';

final class FutureThrottled<T> {
  // region Private Properties

  bool _isFetchOngoing = false;
  final List<Completer<T>> _pendingFetch = [];

  final _fetchLock = Lock();

  FutureThrottled();

  Future<T> execute(Future<T> future) async {
    final completer = Completer<T>();
    _pendingFetch.add(completer);

    await _fetchLock.synchronized(() {
      if (!_isFetchOngoing) {
        _isFetchOngoing = true;

        future //
            .then(
          (value) {
            _isFetchOngoing = false;
            final completer = List.of(_pendingFetch);
            _pendingFetch.clear();
            for (var element in completer) {
              element.complete(value);
            }

            return value;
          },
        ) //
            .catchError(
          (error) {
            _isFetchOngoing = false;
            final newError = error ?? StateError('Unknown Error');
            final completer = List.of(_pendingFetch);
            _pendingFetch.clear();
            for (var element in completer) {
              element.completeError(newError);
            }

            throw newError;
          },
        );
      }
    });

    return completer.future;
  }
}
