//
//  HCNetService.mm
//  hikvision_flutter
//
//  Created by KhoiBV on 2022/08/01.
//

#import <Foundation/Foundation.h>
#import "HikvisionService.h"
#import "HCNetSDK.h"
#include <stdio.h>
#include <ifaddrs.h>
#include <sys/socket.h>
#include <sys/poll.h>
#include <net/if.h>
#import "FLNativeView.h"

@implementation HikvisionService


// ============================
//
//            COMMON
//
// ============================

// Keep the information of current playing (playing handles, playing view, ...)
typedef struct tagHANDLE_STRUCT
{
    int liveHandleId;
    int liveChannelNo;
    
    int playbackHandleId;
    int playbackChannelNo;
    
    UIView *platformView;
    tagHANDLE_STRUCT()
    {
        liveHandleId = -1;
        liveChannelNo = 0;
        playbackHandleId = -1;
        playbackChannelNo = 0;
        platformView = NULL;
    }
}HANDLE_STRUCT, *LPHANDLE_STRUCT;
HANDLE_STRUCT g_structHandle[MAX_VIEW_NUM];

int _currentUserID = -1; // current logged in user ID
int _iStartChan = 0; // some device have startChan number, what is starting number of channelNo we can use
//UIView* _platformView; // video player container

+ (id)instance {
    static HikvisionService *singletonInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singletonInstance = [[self alloc] init];
    });
    return singletonInstance;
}

+(NSString *) getLastDeviceError {
    LONG errorCode = (LONG)NET_DVR_GetLastError();
    char* errorMessage = NET_DVR_GetErrorMsg(&errorCode);
    
    return [NSString stringWithFormat: @"%s (Error code: %d)", errorMessage, errorCode];
}

+(void) setSuccessResponse:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    AccsResponse *result = [AccsResponse alloc];
    [result setStatus:@"OK"];
    completion(result, nil);
}

+(void) setErrorResponse:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    AccsResponse *result = [AccsResponse alloc];
    
    LONG errCode = NET_DVR_GetLastError();
    NSString* errMessage = [self getLastDeviceError];
    [result setStatus:@"NG"];
    [result setErrorMessage:errMessage];
    
    completion(result, [FlutterError errorWithCode:[NSString stringWithFormat:@"%d", errCode] message:errMessage details:nil]);
}


- (void)initialize:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    NSLog(@"Initializing ...");
    if(NET_DVR_Init()) {
        return [HikvisionService setSuccessResponse:completion];
    } else {
        return [HikvisionService setErrorResponse:completion];
    }
}

- (void)login:(LoginRequest *)request completion:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    //- (void)loginRequest:(LoginRequest *)request completion:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    if(_currentUserID >= 0) {
        return [HikvisionService setSuccessResponse:completion];
    }
    
    // device login
    NET_DVR_DEVICEINFO_V40 logindeviceInfo = {0};
    
    NET_DVR_USER_LOGIN_INFO struLoginInfo = {0};
    strcpy(struLoginInfo.sDeviceAddress, (char*)[request.ip UTF8String]);
    struLoginInfo.wPort = [request.port integerValue];
    
    // encode type
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    strcpy(struLoginInfo.sUserName, (char*)[request.username cStringUsingEncoding:enc]);
    strcpy(struLoginInfo.sPassword, (char*)[request.password UTF8String]);
    
    int m_lUserID = NET_DVR_Login_V40(&struLoginInfo, &logindeviceInfo);
    
    printf("m_lUserID[%d] error[%d]\n", m_lUserID, NET_DVR_GetLastError());
    printf("IP address: %s\n", struLoginInfo.sDeviceAddress);
    printf("Port: %d\n", struLoginInfo.wPort);
    printf("Username: %s\n", struLoginInfo.sUserName);
    printf("Password: %s\n", struLoginInfo.sPassword);
    
    // login on failed
    if (m_lUserID == -1)
    {
        return [HikvisionService setErrorResponse:completion];
    }
    
    if(logindeviceInfo.struDeviceV30.byChanNum > 0)
    {
        _iStartChan = logindeviceInfo.struDeviceV30.byStartChan;
    } else {
        _iStartChan = 0;
    }
    
    // keep channelNo info to use in the future
    int iIndex = 0;
    g_structHandle[iIndex].liveChannelNo = [request.channelNo intValue];
    g_structHandle[iIndex].playbackChannelNo = [request.channelNo intValue];
    
    _currentUserID = m_lUserID;
    
    return [HikvisionService setSuccessResponse:completion];
}

- (void)logout:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    if(_currentUserID < 0) {
        return [HikvisionService setSuccessResponse:completion];
    }
    
    if(NET_DVR_Logout(_currentUserID)) {
        _currentUserID = -1;
        return [HikvisionService setSuccessResponse:completion];
    } else {
        return [HikvisionService setErrorResponse:completion];
    }
}


// ============================
//
//       LIVE FUNCTIONS
//
// ============================



- (void)startLive:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    int iIndex = 0;
    
    NSLog(@"Live starting ...");
    NET_DVR_PREVIEWINFO struPreviewInfo = {0};
    struPreviewInfo.lChannel = _iStartChan + iIndex;
    struPreviewInfo.dwStreamType = 0; // Stream type:0-main stream, 1-sub stream, 2-stream 3, 3- virtual stream, and so on
    struPreviewInfo.bBlocked = 1; // 0- non-blocking stream getting, 1- blocking stream getting
    struPreviewInfo.hPlayWnd = [self platformView]; // TODO: how to keep multiple instance of players???
    g_structHandle[iIndex].liveHandleId = NET_DVR_RealPlay_V40(_currentUserID, &struPreviewInfo, NULL, NULL);
    if (g_structHandle[iIndex].liveHandleId == -1)
    {
        NSLog(@"NET_DVR_RealPlay_V40 failed");
        return [HikvisionService setErrorResponse:completion];
    }
    else{
        NSLog(@"ID %d", g_structHandle[iIndex].liveHandleId);
        NSLog(@"NET_DVR_RealPlay_V40 success");
    }
    
    
    //            if(!NET_DVR_OpenSound(g_structHandle[iIndex].iPreviewID))
    //            {
    //                NSLog(@"NET_DVR_OpenSound failed:%d",  NET_DVR_GetLastError());
    //            }
    //
    //            if(!NET_DVR_Volume(g_structHandle[iIndex].iPreviewID, 55))
    //            {
    //                NSLog(@"NET_DVR_Volume failed:%d",  NET_DVR_GetLastError());
    //            }
    //            if(!NET_DVR_CloseSound())
    //            {
    //                NSLog(@"NET_DVR_CloseSound failed:%d",  NET_DVR_GetLastError());
    //            }
    
    return [HikvisionService setSuccessResponse:completion];
}

- (void)stopLive:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion{
    int iIndex = 0;
    
    if(!NET_DVR_StopRealPlay(g_structHandle[iIndex].liveHandleId))
    {
        NSLog(@"NET_DVR_StopRealPlay failed");
        return [HikvisionService setErrorResponse:completion];
    }
    
    g_structHandle[iIndex].liveHandleId = -1;
    
    return [HikvisionService setSuccessResponse:completion];
}



// ============================
//
//     PLAYBACK FUNCTIONS
//
// ============================

- (void)startPlayback:(PlaybackRequest *)request completion:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    int iIndex = 0;
    
    NSLog(@"Playback starting ...");

    NET_DVR_TIME struStartTime = [self _convertStringToCameraDateTime:request.timeFrom];
    NET_DVR_TIME struEndTime = [self _convertStringToCameraDateTime:request.timeTo];
    
    NET_DVR_VOD_PARA struPlaybackInfo = {0};
    struPlaybackInfo.struIDInfo.dwChannel = _iStartChan + iIndex;
    struPlaybackInfo.hWnd = [self platformView]; // TODO: how to keep multiple instance of players???
    struPlaybackInfo.struBeginTime = struStartTime;
    struPlaybackInfo.struEndTime = struEndTime;

    
    int m_lPlaybackID = NET_DVR_PlayBackByTime_V40(_currentUserID, &struPlaybackInfo);
    if (m_lPlaybackID == -1)
    {
        NSLog(@"NET_DVR_PlayBackByTime_V40 failed");
        
        return [HikvisionService setErrorResponse:completion];
    }

    if (!NET_DVR_PlayBackControl_V40(m_lPlaybackID, NET_DVR_PLAYSTART, NULL, 0, NULL, NULL))
    {
        NSLog(@"NET_DVR_PLAYSTART failed:%d",  NET_DVR_GetLastError());
        return [HikvisionService setErrorResponse:completion];
    }
    else{
        NSLog(@"NET_DVR_PLAYSTART succ");
    }
    
    g_structHandle[iIndex].playbackHandleId = m_lPlaybackID;
    
    return [HikvisionService setSuccessResponse:completion];
}

- (void)pausePlayback:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    int iIndex = 0;
    int playbackHandleId = g_structHandle[iIndex].playbackHandleId;
    if (!NET_DVR_PlayBackControl_V40(playbackHandleId , NET_DVR_PLAYPAUSE, NULL, 0, NULL, NULL))
    {
        NSLog(@"NET_DVR_PLAYPAUSE failed:%d",  NET_DVR_GetLastError());
        return [HikvisionService setErrorResponse:completion];
    }
    else{
        NSLog(@"NET_DVR_PLAYPAUSE success");
    }
    
    return [HikvisionService setSuccessResponse:completion];
}

- (void)resumePlayback:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {
    int iIndex = 0;
    int playbackHandleId = g_structHandle[iIndex].playbackHandleId;
    if (!NET_DVR_PlayBackControl_V40(playbackHandleId , NET_DVR_PLAYRESTART, NULL, 0, NULL, NULL))
    {
        NSLog(@"NET_DVR_PLAYRESTART failed:%d",  NET_DVR_GetLastError());
        return [HikvisionService setErrorResponse:completion];
    }
    else{
        NSLog(@"NET_DVR_PLAYRESTART success");
    }
    
    return [HikvisionService setSuccessResponse:completion];
}

- (void)refreshPlayback:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {}
- (void)getPlaybackSnapshot:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {}
- (void)playPlaybackFast:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {}
- (void)playPlaybackSlow:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {}
- (void)playPlaybackNormalSpeed:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {}
- (void)openPlaybackSound:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {}
- (void)closePlaybackSound:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {}
- (void)setPlaybackVolume:(NSNumber *)volumePercent completion:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {}
- (void)searchPlaybackFilesInRange:(NSString *)fromTime to:(NSString *)toTime completion:(void(^)(AccsResponse *_Nullable, FlutterError *_Nullable))completion {}



// ============================
//
//     PRIVATE FUNCTIONS
//
// ============================

-(nullable NSDate*) _convertStringToDate:(nonnull NSString*)datetimeString withFormat:(nonnull NSString*)datetimeFormat {
    
    //    NSString *dateString =  @"2014-10-07T07:29:55.850Z";
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:datetimeFormat];
    NSDate *date = [dateFormatter dateFromString:datetimeString];
    
    return date;
}

-(nullable NSDate*) _convertStringToDate:(nonnull NSString*)datetimeString {
    return [self _convertStringToDate:datetimeString withFormat:@"yyyy/MM/dd HH:mm:ss"];
}

-(NET_DVR_TIME) _convertStringToCameraDateTime:(nonnull NSString*)datetimeString {
    NSDate *date = [self _convertStringToDate:datetimeString];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:date];

    NET_DVR_TIME cameraDateTime = {0};
    cameraDateTime.dwYear = components.year;
    cameraDateTime.dwMonth = components.month;
    cameraDateTime.dwDay = components.day;
    cameraDateTime.dwHour = components.hour;
    cameraDateTime.dwMinute = components.minute;
    cameraDateTime.dwSecond = components.second;
    
    return cameraDateTime;
}


@end
