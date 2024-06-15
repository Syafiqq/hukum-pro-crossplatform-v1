import 'package:hukum_pro/data/data_source/remote/entity/version_data_remote_entity.dart';

abstract interface class HukumProFirebaseService {
  Future<VersionDataRemoteEntity> getLatestVersion();
}
