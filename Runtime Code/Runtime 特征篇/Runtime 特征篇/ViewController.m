//
//  ViewController.m
//  Runtime 特征篇
//
//  Created by t3 on 2017/2/27.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "ViewController.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *feyddy = [[Person alloc] init];
    
    feyddy.name = @"Feyddy";
    feyddy.age = 25;
    [feyddy setValue:@"ios developer" forKey:@"occupation"];
    
    NSDictionary *propertiesResultDict = [feyddy allProperties];
    for (NSString *propertyName in propertiesResultDict.allKeys) {
        NSLog(@"propertyName:%@, propertyValue:%@",propertyName, propertiesResultDict[propertyName]);
    }
    
    NSDictionary *ivarResultDic = [feyddy allIvars];
    for (NSString *ivarName in ivarResultDic.allKeys) {
        NSLog(@"ivarName:%@, ivarValue:%@",ivarName, ivarResultDic[ivarName]);
    }
    
    NSDictionary *methodResultDic = [feyddy allMethods];
    for (NSString *methodName in methodResultDic.allKeys) {
        NSLog(@"methodName:%@, argumentsCount:%@", methodName, methodResultDic[methodName]);
    }
}

@end
