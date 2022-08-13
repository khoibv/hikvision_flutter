#import "HikvisionFlutterPlugin.h"
#import "HCNetService.h"
#import "FLNativeView.h"

@implementation HikvisionFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"hikvision_flutter"
            binaryMessenger:[registrar messenger]];
  HikvisionFlutterPlugin* instance = [[HikvisionFlutterPlugin alloc] init];
  FLNativeViewFactory* factory =
     [[FLNativeViewFactory alloc] initWithMessenger:registrar.messenger];
  [registrar registerViewFactory:factory withId:@"<platform-view-type>"];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"initSdk" isEqualToString:call.method]){
      HCNetService* service = [[HCNetService alloc] init];
      result(@([service initSdk]));
  }
  else if ([@"login" isEqualToString:call.method]){
      HCNetService* service = [[HCNetService alloc] init];
      NSString* username = call.arguments[@"username"];
      NSString* pass = call.arguments[@"password"];
      NSString* ip = call.arguments[@"ip"];
      NSString* port = call.arguments[@"port"];
      NSDictionary<NSString*, id>* loginResult = [service login:username password:pass port:port iP:ip];

      result(loginResult);
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

@end
