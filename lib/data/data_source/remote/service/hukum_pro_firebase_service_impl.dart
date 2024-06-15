import 'package:firebase_database/firebase_database.dart';
import 'package:hukum_pro/data/data_source/remote/service/hukum_pro_firebase_service.dart';

final class HukumProFirebaseServiceImpl implements HukumProFirebaseService {
  final FirebaseDatabase _infrastructure;

  HukumProFirebaseServiceImpl(this._infrastructure);
}
