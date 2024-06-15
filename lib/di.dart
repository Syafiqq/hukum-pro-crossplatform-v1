import 'package:hukum_pro/data/di/di_data.dart';
import 'package:hukum_pro/infrastructure/di/di_infrastructure.dart';

class Di {
  static void setup() {
    DiInfrastructure.setup();
    DiData.setup();
  }
}
