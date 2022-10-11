#import "NativeBmiPlugin.h"
#if __has_include(<native_bmi/native_bmi-Swift.h>)
#import <native_bmi/native_bmi-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "native_bmi-Swift.h"
#endif

@implementation NativeBmiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNativeBmiPlugin registerWithRegistrar:registrar];
}
@end
