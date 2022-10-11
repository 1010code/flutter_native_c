import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

/** C & Dart function signatures */
// 取得年齡(回傳整數)
typedef getAgeFunction = Int Function();
typedef getAgeFunctionDart = int Function();
// 計算 BMI 數值(回傳浮點)
typedef calculateBMIFunction = Double Function(Double weight, Double hight);
typedef calculateBMIFunctionDart = double Function(double weight, double hight);
// 評估結果(回傳字串)
typedef getResultFunction = Pointer<Int8> Function(Double weight, Double hight);
typedef getResultFunctionDart = Pointer<Int8> Function(
    double weight, double hight);
// 取得版本(回傳字串)
typedef getVersionFunction = Pointer<Int8> Function();
typedef getVersionFunctionDart = Pointer<Int8> Function();

/** 封裝 */
class FFIBridge {
  late getAgeFunctionDart _getAge;
  late calculateBMIFunctionDart _calculateBMI;
  late getResultFunctionDart _getResult;
  late getVersionFunctionDart _getVersion;

  FFIBridge() {
    // Getting a library
    final dl = Platform.isAndroid
        ? DynamicLibrary.open('libnative_bmi.so')
        : DynamicLibrary.process();
    // Looking for the functions
    _getAge = dl.lookupFunction<getAgeFunction, getAgeFunctionDart>('getAge');
    _calculateBMI =
        dl.lookupFunction<calculateBMIFunction, calculateBMIFunctionDart>(
            'calculateBMI');
    _getResult = dl
        .lookupFunction<getResultFunction, getResultFunctionDart>('getResult');
    _getVersion = dl.lookupFunction<getVersionFunction, getVersionFunctionDart>(
        'getVersion');
  }

  // Flutter 建立函式透過 FFI 呼叫 Native code
  int getAge() => _getAge();
  double calculateBMI() => _calculateBMI(50, 170);
  String getResult() => _getResult(50, 170).cast<Utf8>().toDartString();
  String getVersion() {
    return _getVersion().cast<Utf8>().toDartString();
  }
}
