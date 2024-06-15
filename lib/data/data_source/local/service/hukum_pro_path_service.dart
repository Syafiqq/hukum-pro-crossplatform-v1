import 'dart:io';

abstract interface class HukumProPathService {
  Future<Directory> getLocalDbDirectory();
}
