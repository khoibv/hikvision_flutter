//
//  HCNetService.h
//  Pods
//
//  Created by KhoiBV on 2022/08/01.
//
#import <Foundation/Foundation.h>

@interface HCNetService : NSObject
@property (nonatomic) int userID;
@property (nonatomic) int iStartChan;

-(bool) initSdk;
-(NSDictionary<NSString*, id>*) login:(NSString*)username password:(NSString*)password port:(NSString*)port iP:(NSString*)iP;
@end

