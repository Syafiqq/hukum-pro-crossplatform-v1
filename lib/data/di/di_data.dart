import 'package:hukum_pro/data/di/di_datasource_cache.dart';
import 'package:hukum_pro/data/di/di_datasource_remote.dart';

class DiData {
  static void setup() {
    DiDatasourceRemote.setup();
    DiDatasourceCache.setup();
  }
}
