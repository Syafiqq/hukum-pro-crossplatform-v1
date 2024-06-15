import 'package:hukum_pro/data/data_source/remote/impl/hukum_pro_remote_data_source.dart';
import 'package:hukum_pro/data/data_source/remote/service/hukum_pro_firebase_service.dart';

final class HukumProRemoteDataSourceImpl implements HukumProRemoteDataSource {
  final HukumProFirebaseService _firebase;

  HukumProRemoteDataSourceImpl(this._firebase);
}
