import 'package:flutter_test/flutter_test.dart';
import 'package:native_bmi/native_bmi.dart';
import 'package:native_bmi/native_bmi_platform_interface.dart';
import 'package:native_bmi/native_bmi_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeBmiPlatform
    with MockPlatformInterfaceMixin
    implements NativeBmiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NativeBmiPlatform initialPlatform = NativeBmiPlatform.instance;

  test('$MethodChannelNativeBmi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeBmi>());
  });

  test('getPlatformVersion', () async {
    NativeBmi nativeBmiPlugin = NativeBmi();
    MockNativeBmiPlatform fakePlatform = MockNativeBmiPlatform();
    NativeBmiPlatform.instance = fakePlatform;

    expect(await nativeBmiPlugin.getPlatformVersion(), '42');
  });
}
