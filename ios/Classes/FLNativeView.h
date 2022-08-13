//
//  FLNativeView.h
//  hikvision_flutter
//
//  Created by KhoiBV on 2022/08/01.
//

#import <Flutter/Flutter.h>

@interface FLNativeViewFactory : NSObject <FlutterPlatformViewFactory>
-(instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
- (NSObject<FlutterMessageCodec>*)createArgsCodec;
@end

@interface FLNativeView : NSObject <FlutterPlatformView>

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
              binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

- (UIView*)view;
@end
