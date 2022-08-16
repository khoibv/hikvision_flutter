// Autogenerated from Pigeon (v3.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "platform_communication.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ?: [NSNull null]),
        @"message": (error.message ?: [NSNull null]),
        @"details": (error.details ?: [NSNull null]),
        };
  }
  return @{
      @"result": (result ?: [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface LoginRequest ()
+ (LoginRequest *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface AccsResponse ()
+ (AccsResponse *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface PlaybackRequest ()
+ (PlaybackRequest *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation LoginRequest
+ (instancetype)makeWithIp:(NSString *)ip
    port:(NSNumber *)port
    username:(NSString *)username
    password:(NSString *)password
    channelNo:(NSNumber *)channelNo {
  LoginRequest* pigeonResult = [[LoginRequest alloc] init];
  pigeonResult.ip = ip;
  pigeonResult.port = port;
  pigeonResult.username = username;
  pigeonResult.password = password;
  pigeonResult.channelNo = channelNo;
  return pigeonResult;
}
+ (LoginRequest *)fromMap:(NSDictionary *)dict {
  LoginRequest *pigeonResult = [[LoginRequest alloc] init];
  pigeonResult.ip = GetNullableObject(dict, @"ip");
  NSAssert(pigeonResult.ip != nil, @"");
  pigeonResult.port = GetNullableObject(dict, @"port");
  NSAssert(pigeonResult.port != nil, @"");
  pigeonResult.username = GetNullableObject(dict, @"username");
  NSAssert(pigeonResult.username != nil, @"");
  pigeonResult.password = GetNullableObject(dict, @"password");
  NSAssert(pigeonResult.password != nil, @"");
  pigeonResult.channelNo = GetNullableObject(dict, @"channelNo");
  NSAssert(pigeonResult.channelNo != nil, @"");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return @{
    @"ip" : (self.ip ?: [NSNull null]),
    @"port" : (self.port ?: [NSNull null]),
    @"username" : (self.username ?: [NSNull null]),
    @"password" : (self.password ?: [NSNull null]),
    @"channelNo" : (self.channelNo ?: [NSNull null]),
  };
}
@end

@implementation AccsResponse
+ (instancetype)makeWithStatus:(NSString *)status
    errorMessage:(nullable NSString *)errorMessage {
  AccsResponse* pigeonResult = [[AccsResponse alloc] init];
  pigeonResult.status = status;
  pigeonResult.errorMessage = errorMessage;
  return pigeonResult;
}
+ (AccsResponse *)fromMap:(NSDictionary *)dict {
  AccsResponse *pigeonResult = [[AccsResponse alloc] init];
  pigeonResult.status = GetNullableObject(dict, @"status");
  NSAssert(pigeonResult.status != nil, @"");
  pigeonResult.errorMessage = GetNullableObject(dict, @"errorMessage");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return @{
    @"status" : (self.status ?: [NSNull null]),
    @"errorMessage" : (self.errorMessage ?: [NSNull null]),
  };
}
@end

@implementation PlaybackRequest
+ (instancetype)makeWithTimeFrom:(NSString *)timeFrom
    timeTo:(NSString *)timeTo {
  PlaybackRequest* pigeonResult = [[PlaybackRequest alloc] init];
  pigeonResult.timeFrom = timeFrom;
  pigeonResult.timeTo = timeTo;
  return pigeonResult;
}
+ (PlaybackRequest *)fromMap:(NSDictionary *)dict {
  PlaybackRequest *pigeonResult = [[PlaybackRequest alloc] init];
  pigeonResult.timeFrom = GetNullableObject(dict, @"timeFrom");
  NSAssert(pigeonResult.timeFrom != nil, @"");
  pigeonResult.timeTo = GetNullableObject(dict, @"timeTo");
  NSAssert(pigeonResult.timeTo != nil, @"");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return @{
    @"timeFrom" : (self.timeFrom ?: [NSNull null]),
    @"timeTo" : (self.timeTo ?: [NSNull null]),
  };
}
@end

@interface HikvisionSdkCodecReader : FlutterStandardReader
@end
@implementation HikvisionSdkCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [AccsResponse fromMap:[self readValue]];
    
    case 129:     
      return [LoginRequest fromMap:[self readValue]];
    
    case 130:     
      return [PlaybackRequest fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface HikvisionSdkCodecWriter : FlutterStandardWriter
@end
@implementation HikvisionSdkCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[AccsResponse class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[LoginRequest class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[PlaybackRequest class]]) {
    [self writeByte:130];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface HikvisionSdkCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation HikvisionSdkCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[HikvisionSdkCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[HikvisionSdkCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *HikvisionSdkGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    HikvisionSdkCodecReaderWriter *readerWriter = [[HikvisionSdkCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}


void HikvisionSdkSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<HikvisionSdk> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.initialize"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(initialize:)], @"HikvisionSdk api (%@) doesn't respond to @selector(initialize:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api initialize:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.login"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(login:completion:)], @"HikvisionSdk api (%@) doesn't respond to @selector(login:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        LoginRequest *arg_request = GetNullableObjectAtIndex(args, 0);
        [api login:arg_request completion:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.logout"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(logout:)], @"HikvisionSdk api (%@) doesn't respond to @selector(logout:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api logout:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.startLive"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(startLive:)], @"HikvisionSdk api (%@) doesn't respond to @selector(startLive:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api startLive:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.stopLive"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(stopLive:)], @"HikvisionSdk api (%@) doesn't respond to @selector(stopLive:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api stopLive:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.startPlayback"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(startPlayback:completion:)], @"HikvisionSdk api (%@) doesn't respond to @selector(startPlayback:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        PlaybackRequest *arg_request = GetNullableObjectAtIndex(args, 0);
        [api startPlayback:arg_request completion:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.pausePlayback"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(pausePlayback:)], @"HikvisionSdk api (%@) doesn't respond to @selector(pausePlayback:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api pausePlayback:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.resumePlayback"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(resumePlayback:)], @"HikvisionSdk api (%@) doesn't respond to @selector(resumePlayback:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api resumePlayback:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.refreshPlayback"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(refreshPlayback:)], @"HikvisionSdk api (%@) doesn't respond to @selector(refreshPlayback:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api refreshPlayback:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.getPlaybackSnapshot"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getPlaybackSnapshot:)], @"HikvisionSdk api (%@) doesn't respond to @selector(getPlaybackSnapshot:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api getPlaybackSnapshot:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.playPlaybackFast"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(playPlaybackFast:)], @"HikvisionSdk api (%@) doesn't respond to @selector(playPlaybackFast:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api playPlaybackFast:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.playPlaybackSlow"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(playPlaybackSlow:)], @"HikvisionSdk api (%@) doesn't respond to @selector(playPlaybackSlow:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api playPlaybackSlow:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.playPlaybackNormalSpeed"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(playPlaybackNormalSpeed:)], @"HikvisionSdk api (%@) doesn't respond to @selector(playPlaybackNormalSpeed:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api playPlaybackNormalSpeed:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.openPlaybackSound"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(openPlaybackSound:)], @"HikvisionSdk api (%@) doesn't respond to @selector(openPlaybackSound:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api openPlaybackSound:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.closePlaybackSound"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(closePlaybackSound:)], @"HikvisionSdk api (%@) doesn't respond to @selector(closePlaybackSound:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api closePlaybackSound:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.setPlaybackVolume"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(setPlaybackVolume:completion:)], @"HikvisionSdk api (%@) doesn't respond to @selector(setPlaybackVolume:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSNumber *arg_volumePercent = GetNullableObjectAtIndex(args, 0);
        [api setPlaybackVolume:arg_volumePercent completion:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HikvisionSdk.searchPlaybackFilesInRange"
        binaryMessenger:binaryMessenger
        codec:HikvisionSdkGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(searchPlaybackFilesInRange:to:completion:)], @"HikvisionSdk api (%@) doesn't respond to @selector(searchPlaybackFilesInRange:to:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_fromTime = GetNullableObjectAtIndex(args, 0);
        NSString *arg_toTime = GetNullableObjectAtIndex(args, 1);
        [api searchPlaybackFilesInRange:arg_fromTime to:arg_toTime completion:^(AccsResponse *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
