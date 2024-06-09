import 'package:hukum_pro/data/data_source/remote/entity/version_data_remote_entity.dart';
import 'package:hukum_pro/data/data_source/remote/service/hukum_pro_firebase_service.dart';

final class HukumProRemoteDataSource implements HukumProFirebaseService {
  final HukumProFirebaseService _firebase;

  HukumProRemoteDataSource(this._firebase);

  @override
  Future<VersionDataRemoteEntity> getLatestVersion() {
    return _firebase.getLatestVersion();
  }
}
