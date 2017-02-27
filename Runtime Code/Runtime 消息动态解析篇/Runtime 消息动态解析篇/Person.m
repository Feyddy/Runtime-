//
//  Person.m
//  Runtime 消息动态解析篇
//
//  Created by t3 on 2017/2/27.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "Person.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif
@implementation Person

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    //我们没有给Person类实现eat方法，我们这里动态添加方法
    if ([NSStringFromSelector(sel) isEqualToString:@"eat"]) {
        class_addMethod(self, sel, (IMP)otherEat, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void otherEat(id self, SEL cmd) {
    NSLog(@"%@正在吃代码！！！",((Person *)self).name);
}

@end
