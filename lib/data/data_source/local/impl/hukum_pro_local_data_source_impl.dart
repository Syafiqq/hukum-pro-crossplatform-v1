import 'package:hukum_pro/data/data_source/local/impl/hukum_pro_local_data_source.dart';
import 'package:hukum_pro/data/data_source/local/service/hukum_pro_isar_service.dart';

final class HukumProLocalDataSourceImpl implements HukumProLocalDataSource {
  final HukumProIsarService _isar;

  HukumProLocalDataSourceImpl(this._isar);
}
