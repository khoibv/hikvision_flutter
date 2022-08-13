//
//  Preview.h
//  Pods
//
//  Created by KhoiBV on 2022/08/01.
//


#ifndef SimpleDemo_Preview_h
#define SimpleDemo_Preview_h
#import <UIKit/UIKit.h>

#define MAX_VIEW_NUM    4

int startPreview(int iUserID, int iStartChan, UIView *pView, int iIndex);
void stopPreview(int iIndex);


#endif
