import 'package:firebase_database/firebase_database.dart';
import 'package:hukum_pro/common/error/data_exception.dart';
import 'package:hukum_pro/common/helper/util/util_parse_type.dart';
import 'package:hukum_pro/data/data_source/remote/entity/version_data_remote_entity.dart';
import 'package:hukum_pro/data/data_source/remote/service/hukum_pro_firebase_service.dart';

final class HukumProFirebaseServiceImpl implements HukumProFirebaseService {
  final FirebaseDatabase _infrastructure;

  HukumProFirebaseServiceImpl(this._infrastructure);

  @override
  Future<VersionDataRemoteEntity> getLatestVersion() {
    throw StateError('message');
  }
}

extension _HukumProFirebaseServiceImpl on HukumProFirebaseServiceImpl {
  @override
  Future<VersionDataRemoteEntity> _getLatestVersion() async {
    final snapshot = await _infrastructure
        .ref('versions_new/v2')
        .orderByKey()
        .limitToLast(1)
        .get();

    if (!snapshot.exists) {
      throw const DataException.noData();
    }

    final key = snapshot.key?.toInt();
    if (key == null) {
      throw const DataException.noData();
    }

    final resultMapRaw = snapshot.value as Map<Object?, Object?>?;
    final resultMap = resultMapRaw?.map(
      (key, value) => MapEntry(
        key.toString(),
        value,
      ),
    );
    if (resultMap == null) {
      throw const FormatException('Failed to parse data');
    }

    return VersionDataRemoteEntity.fromJsonWithId(resultMap, key);
  }
}
