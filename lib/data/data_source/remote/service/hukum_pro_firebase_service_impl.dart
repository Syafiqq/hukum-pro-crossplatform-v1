import 'package:firebase_database/firebase_database.dart';
import 'package:hukum_pro/common/error/data_exception.dart';
import 'package:hukum_pro/data/data_source/remote/entity/version_data_remote_entity.dart';
import 'package:hukum_pro/data/data_source/remote/service/hukum_pro_firebase_service.dart';
import 'package:hukum_pro/infrastructure/firebase/auth/future_firebase_auth.dart';

final class HukumProFirebaseServiceImpl implements HukumProFirebaseService {
  final FirebaseDatabase _infrastructure;

  HukumProFirebaseServiceImpl(this._infrastructure);

  @override
  Future<VersionDataRemoteEntity> getLatestVersion() {
    return FutureFirebaseAuth.ensureFirebaseIsAuthenticated(
      () async {
        final data = await _getLatestDataWithStringId(path: 'versions_new/v2');
        return VersionDataRemoteEntity.fromJson(data);
      },
    );
  }
}

extension _HukumProFirebaseServiceImpl on HukumProFirebaseServiceImpl {
  Future<Map<String, dynamic>> _getLatestDataWithStringId(
      {required String path}) async {
    final snapshot = await _infrastructure
        .ref(path)
        .orderByKey()
        .limitToLast(1)
        .once()
        .then((v) => v.snapshot);

    if (!snapshot.exists) {
      throw const DataException.noData();
    }

    if (snapshot.children.isEmpty) {
      throw const DataException.noData();
    }

    final child = snapshot.children.first;

    if (!child.exists) {
      throw const DataException.noData();
    }

    final key = child.key;
    final value = child.value;
    if (key == null) {
      throw const DataException.noData();
    }

    if (value == null) {
      throw const DataException.noData();
    }

    final resultMap = Map<String, dynamic>.from(value as Map);

    if (!resultMap.containsKey('id')) {
      resultMap['id'] = key;
    }

    return resultMap;
  }
}
