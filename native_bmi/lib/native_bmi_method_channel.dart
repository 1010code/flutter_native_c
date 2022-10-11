import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_bmi_platform_interface.dart';

/// An implementation of [NativeBmiPlatform] that uses method channels.
class MethodChannelNativeBmi extends NativeBmiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_bmi');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
