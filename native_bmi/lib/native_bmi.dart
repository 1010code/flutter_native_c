
import 'native_bmi_platform_interface.dart';

class NativeBmi {
  Future<String?> getPlatformVersion() {
    return NativeBmiPlatform.instance.getPlatformVersion();
  }
}
