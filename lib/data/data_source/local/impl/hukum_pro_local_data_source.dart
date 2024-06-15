import 'package:hukum_pro/data/data_source/local/entity/law_menu_order_data_local_entity.dart';

abstract interface class HukumProLocalDataSource {
  Future<void> replaceLawMenus(List<LawMenuOrderDataLocalEntity> menus);
}
