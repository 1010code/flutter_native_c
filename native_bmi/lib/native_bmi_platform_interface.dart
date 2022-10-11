import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_bmi_method_channel.dart';

abstract class NativeBmiPlatform extends PlatformInterface {
  /// Constructs a NativeBmiPlatform.
  NativeBmiPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeBmiPlatform _instance = MethodChannelNativeBmi();

  /// The default instance of [NativeBmiPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeBmi].
  static NativeBmiPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeBmiPlatform] when
  /// they register themselves.
  static set instance(NativeBmiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
