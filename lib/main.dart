import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hukum_pro/data/data_source/cache/entity/version_data_cache_entity.dart';
import 'package:hukum_pro/data/data_source/cache/impl/hukum_pro_cache_data_source.dart';
import 'package:hukum_pro/data/data_source/remote/impl/hukum_pro_remote_data_source.dart';
import 'package:hukum_pro/di.dart';
import 'package:hukum_pro/infrastructure/di/di.dart';
import 'package:hukum_pro/infrastructure/firebase/auth/firebase_user_monitor_service.dart';
import 'package:hukum_pro/infrastructure/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // DI
  Di.setup();

  // Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Firebase Auth
  di<FirebaseUserMonitorService>().start();

  await testCds();
}

Future testCds() async {
  void pp(VersionDataCacheEntity? version) {
    if (version == null) {
      print('CurrentLog - id - null');
    }
    // print all value properties
    print('CurrentLog - id - ${version?.id}');
    print('CurrentLog - milis - ${version?.milis}');
    print('CurrentLog - version - ${version?.version}');
    print('CurrentLog - timestamp - ${version?.timestamp}');
  }
  final ds = di<HukumProCacheDataSource>();
  pp(await ds.getVersion());
  ds.setVersion(
    VersionDataCacheEntity(
      id: 'id',
      milis: 1,
      version: 2,
      timestamp: 'timestamp',
    ),
  );
  pp(await ds.getVersion());
}

void testRds() {
  di<HukumProRemoteDataSource>().getLatestVersion().then((value) {
    // print all value properties
    print('CurrentLog - id - ${value.id}');
    print('CurrentLog - milis - ${value.milis}');
    print('CurrentLog - version - ${value.version}');
    print('CurrentLog - timestamp - ${value.timestamp}');
    print('CurrentLog - detail - ${value.detail}');
  });
}
