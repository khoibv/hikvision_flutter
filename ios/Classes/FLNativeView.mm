//
//  FLNativeView.m
//  hikvision_flutter
//
//  Created by KhoiBV on 2022/08/01.
//

#import "FLNativeView.h"
#import "HikvisionService.h"

@implementation FLNativeViewFactory {
    NSObject<FlutterBinaryMessenger>* _messenger;
}

-(instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    self = [super init];
    if (self) {
        _messenger = messenger;
    }
    return self;
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args {
    return [[FLNativeView alloc] initWithFrame:frame
                                viewIdentifier:viewId
                                     arguments:args
                               binaryMessenger:_messenger];
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

@end

@implementation FLNativeView {
    UIView *_view;
}

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    if (self = [super init]) {
        _view = [[UIView alloc] initWithFrame:frame];
        //        _view = [[UIView alloc] initWithFrame:frame];
    }
    
    _view.contentMode = UIViewContentModeScaleAspectFit;
    _view.backgroundColor = [UIColor blackColor];
    _view.clipsToBounds = YES;
    _view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // inject view after created into SDK service
    HikvisionService* service = [HikvisionService instance];
    service.platformView = _view;
    
    //    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    //
    //    UIView *cameraView = [[UIView alloc] initWithFrame:CGRectMake(0,0,width, 200)];
    //    _view.backgroundColor = [UIColor brownColor];
    //    [_view addSubview:cameraView];
    //    int userID = [args[@"userID"] intValue];
    //    int startChan = [args[@"startChan"] intValue];
    //    startLive(userID, startChan, cameraView, 0);

    return self;
}

- (UIView*)view {
    return _view;
}

@end
