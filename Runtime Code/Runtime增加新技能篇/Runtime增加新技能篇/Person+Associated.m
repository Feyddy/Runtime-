//
//  Person+Associated.m
//  Runtime增加新技能篇
//
//  Created by t3 on 2017/2/27.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "Person+Associated.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif
@implementation Person (Associated)

- (void)setAssociatedHeight:(NSNumber *)associatedHeight
{
    //设置关联对象
    objc_setAssociatedObject(self, @selector(associatedHeight), associatedHeight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSNumber *)associatedHeight {
    //得到关联对象
    return objc_getAssociatedObject(self, @selector(associatedHeight));
}

- (void)setAssociatedCallBack:(CodingCallBack)associatedCallBack {
    objc_setAssociatedObject(self, @selector(associatedCallBack), associatedCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CodingCallBack)associatedCallBack {
    return objc_getAssociatedObject(self, @selector(associatedCallBack));
}

@end
