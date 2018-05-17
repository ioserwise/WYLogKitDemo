//
//  WYLogDefine.h
//  WYLogKit
//
//  Created by Weep Yan on 2018/5/12.
//  Copyright © 2018年 Weep Yan. All rights reserved.
//

#ifndef WYLogDefine_h
#define WYLogDefine_h

#define WYDevLog(format, ...) \
if ([WYLogManager sharedLogManager].isOpenDevLog) {                                 \
    do {                                                                            \
        fprintf(stderr, "---WYDevLog---\n");                                        \
        fprintf(stderr, "<%s: %d> %s\n",                                            \
        [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
        __LINE__, __func__);                                                        \
        (WYLog)((format), ##__VA_ARGS__);                                           \
        fprintf(stderr, "----—-----—---\n");                                        \
    } while (0);                                                                    \
} else {                                                                            \
    (WYLog)((format), ##__VA_ARGS__);                                               \
}

#endif /* WYLogDefine_h */
