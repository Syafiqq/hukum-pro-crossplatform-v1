import 'package:hukum_pro/data/data_source/local/entity/law_menu_order_data_local_entity.dart';
import 'package:hukum_pro/data/data_source/local/service/hukum_pro_path_service.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';
import 'package:isar/isar.dart';

class DiIsar {
  static void setup() {
    di.registerLazySingletonAsync<Isar>(
      () async {
        final directory = await di<HukumProPathService>().getLocalDbDirectory();
        final isar = Isar.openAsync(schemas: [
          LawMenuOrderDataLocalEntitySchema
        ], directory: directory.path);
        return isar;
      },
    );
  }
}
