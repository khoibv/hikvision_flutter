#import "HikvisionFlutterPlugin.h"
#import "HikvisionService.h"
#import "FLNativeView.h"
#import "platform_communication.h"

@implementation HikvisionFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FLNativeViewFactory* factory =
    [[FLNativeViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:factory withId:@"vn.zensho.hikvision.hikvision_flutter.platformView"];
    
    HikvisionService *hcnetService = [HikvisionService instance];
    HikvisionSdkSetup(registrar.messenger, hcnetService);
}
@end
