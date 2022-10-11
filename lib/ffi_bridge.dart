import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

typedef TemperatureFunction = Double Function();
typedef TemperatureFunctionDart = double Function();
// TODO: Add getName here
typedef NameFunction = Pointer<Int8> Function();
typedef NameFunctionDart = Pointer<Int8> Function();

class FFIBridge {
  late TemperatureFunctionDart _getTemperature;
  late NameFunctionDart _getName;
  // TODO: Add _getForecast declaration here
  // TODO: Add _getThreeDayForecast here

  FFIBridge() {
    // 1
    final dl = Platform.isAndroid
        ? DynamicLibrary.open('libweather.so')
        : DynamicLibrary.process();

    _getTemperature = dl
        // 2
        .lookupFunction<
            // 3
            TemperatureFunction,
            // 4
            TemperatureFunctionDart>('get_temperature');

    // TODO: Assign value to _getName
    _getName = dl.lookupFunction<NameFunction, NameFunctionDart>('getName');
  }

  // 5
  double getTemperature() => _getTemperature();
  // 無傳參數，有返回值
  String getName() {
    return _getName().cast<Utf8>().toDartString();
  }
}
