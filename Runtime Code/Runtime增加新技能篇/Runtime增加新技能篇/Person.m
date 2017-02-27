//
//  Person.m
//  Runtime 特征篇
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

- (NSDictionary *)allProperties {
    unsigned int count = 0;
    
    //获取类的所有属性，如果没有属性count就为0
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableDictionary *resultDict = [@{}mutableCopy];
    
    for (NSUInteger i = 0; i < count; i++) {
        //获取属性的名称和值
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        
        if (propertyValue) {
            resultDict[name] = propertyValue;
        }else{
            resultDict[name] = @"字典的key对应的value不能为nil哦！";
        }
    }
    
    //这里properties是一个数组指针，我们需要使用free函数来释放内存
    free(properties);
    
    return resultDict;
}


- (NSDictionary *)allIvars
{
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        const char *varName = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:varName];
        id varValue = [self valueForKey:name];
        
        if (varValue) {
            resultDict[name] = varValue;
        } else {
            resultDict[name] = @"字典的key对应的value不能为nil哦！";
        }
        
    }
    
    free(ivars);
    
    return resultDict;
}

- (NSDictionary *)allMethods
{
    unsigned int count = 0;
    
    // 获取类的所有方法，如果没有方法count就为0
    Method *methods = class_copyMethodList([self class], &count);
    
    NSMutableDictionary *resultDict = [@{} mutableCopy];
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        // 获取方法名称
        SEL methodSEL = method_getName(methods[i]);
        const char *methodName = sel_getName(methodSEL);
        NSString *name = [NSString stringWithUTF8String:methodName];
        
        // 获取方法的参数列表
        int arguments = method_getNumberOfArguments(methods[i]);
        
        resultDict[name] = @(arguments-2);
    }
    
    free(methods);
    
    return resultDict;
}
@end
