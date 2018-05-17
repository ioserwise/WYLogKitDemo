//
//  WYLogManager.h
//  WYLogKit
//
//  Created by Weep Yan on 2018/5/12.
//  Copyright © 2018年 Weep Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT void WYLog(NSString *format, ...) NS_FORMAT_FUNCTION(1,2) NS_NO_TAIL_CALL;

@interface WYLogManager : NSObject

+ (instancetype)sharedLogManager;

@property (nonatomic, assign, getter=isOpenLog) BOOL openLog;// Default is NO. If set NO, then the 'openDevLog' is setting NO auto.
@property (nonatomic, assign, getter=isOpenDevLog) BOOL openDevLog;// Default is NO. If set YES, then the 'openLog' is setting YES auto.

@end
