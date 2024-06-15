import 'dart:io';

import 'package:hukum_pro/data/data_source/local/service/hukum_pro_path_service.dart';
import 'package:path_provider/path_provider.dart';

final class HukumProPathServiceImpl implements HukumProPathService {
  HukumProPathServiceImpl();

  @override
  Future<Directory> getLocalDbDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    final targetDirectory = Directory('${dir.path}/isar');
    return await targetDirectory.create(recursive: true);
  }
}
