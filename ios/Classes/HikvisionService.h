//
//  HCNetService.h
//  Pods
//
//  Created by KhoiBV on 2022/08/01.
//
#import <Foundation/Foundation.h>
#import "platform_communication.h"
#import "HCNetSDK.h"

@interface HikvisionService : NSObject<HikvisionSdk>

// ============================
//
//            COMMON
//
// ============================

#define MAX_VIEW_NUM    4

@property (nonatomic) int userID;
@property (nonatomic) int iStartChan;
@property (nonatomic, nullable) UIView* platformView;

+(nonnull id)instance;

+(nullable NSString *) getLastDeviceError;
+(void) setSuccessResponse:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion;
+(void) setErrorResponse:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion;
//-(AccsResponse*) initialize;
//-(NSDictionary<NSString*, id>*) login:(NSString*)username password:(NSString*)password port:(NSString*)port iP:(NSString*)iP;


// ============================
//
//       LIVE FUNCTIONS
//
// ============================
//int startLive(int iUserID, int iStartChan, UIView *pView, int iIndex);
//void stopLive(int iIndex);


// ============================
//
//     PLAYBACK FUNCTIONS
//
// ============================


// ============================
//
//     PRIVATE FUNCTIONS
//
// ============================
-(nullable NSDate*) _convertStringToDate:(nonnull NSString*)datetimeString withFormat:(nonnull NSString*)datetimeFormat;

// convert String to Date, with default format yyyy/MM/dd HH:mm:ss
-(nullable NSDate*) _convertStringToDate:(nonnull NSString*)datetimeString;

-(NET_DVR_TIME) _convertStringToCameraDateTime:(nonnull NSString*)datetimeString;

@end

