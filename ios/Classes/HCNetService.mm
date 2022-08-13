//
//  HCNetService.m
//  hikvision_flutter
//
//  Created by KhoiBV on 2022/08/01.
//

#import <Foundation/Foundation.h>
#import "HCNetService.h"
#import "HCNetSDK.h"
#include <stdio.h>
#include <ifaddrs.h>
#include <sys/socket.h>
#include <sys/poll.h>
#include <net/if.h>
#import "Preview.h"
#import "FLNativeView.h"

@implementation HCNetService

int _userID;
int _iStartChan;

-(bool) initSdk{
    return NET_DVR_Init();
}

-(NSDictionary<NSString*, id>*) login:(NSString*)username password:(NSString*)password port:(NSString*)port iP:(NSString*)iP
{
    // device login
    NET_DVR_DEVICEINFO_V40 logindeviceInfo = {0};

    NET_DVR_USER_LOGIN_INFO struLoginInfo = {0};
    strcpy(struLoginInfo.sDeviceAddress, (char*)[iP UTF8String]);
    struLoginInfo.wPort = [port integerValue];

    // encode type
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    strcpy(struLoginInfo.sUserName, (char*)[username cStringUsingEncoding:enc]);
    strcpy(struLoginInfo.sPassword, (char*)[password UTF8String]);

    int m_lUserID = NET_DVR_Login_V40(&struLoginInfo, &logindeviceInfo);

    printf("m_lUserID[%d] error[%d]\n", m_lUserID, NET_DVR_GetLastError());
    printf("iP:%s\n", struLoginInfo.sDeviceAddress);
    printf("Port:%d\n", struLoginInfo.wPort);
    printf("UsrName:%s\n", struLoginInfo.sUserName);
    printf("Password:%s\n", struLoginInfo.sPassword);

    printf("%s", NET_DVR_GetErrorMsg());

    // login on failed
    if (m_lUserID == -1)
    {
        return @{};
    }
    int g_iStartChan = 0;

    if(logindeviceInfo.struDeviceV30.byChanNum > 0)
    {
        g_iStartChan = logindeviceInfo.struDeviceV30.byStartChan;
    }

    _userID = m_lUserID;
    _iStartChan = g_iStartChan;

    return @{
        @"userID": @(m_lUserID),
        @"startChan": @(g_iStartChan)
    };
}

-(int) userID{
    return _userID;
}

-(int) iStartChan{
    return _iStartChan;
}

@end
