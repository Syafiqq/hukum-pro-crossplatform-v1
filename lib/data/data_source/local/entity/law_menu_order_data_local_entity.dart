import 'package:isar/isar.dart';

part 'law_menu_order_data_local_entity.g.dart';

@collection
@Name('LawOrder')
class LawMenuOrderDataLocalEntity {
  @Name('id')
  late int id;

  @Index()
  @Name('remote_id')
  late String? remoteId;

  @Index()
  @Name('order')
  late short? order;

  @Name('name')
  late String? name;
}
