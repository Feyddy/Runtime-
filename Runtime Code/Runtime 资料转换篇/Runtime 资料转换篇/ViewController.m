//
//  ViewController.m
//  Runtime 资料转换篇
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
    
    NSDictionary *dict = @{
                           @"name" : @"Feyddy",
                           @"age"  : @25,
                           @"occupation" : @"ios developer",
                           @"nationality" : @"China"
                           };
    
    // 字典转模型
    Person *feyddy = [[Person alloc] initWithDictionary:dict];
    NSLog(@"热烈欢迎，从%@远道而来的%@岁的%@%@",feyddy.nationality,feyddy.age,feyddy.name,feyddy.occupation);
    
    // 模型转字典
    NSDictionary *covertedDict = [feyddy covertToDictionary];
    NSLog(@"%@",covertedDict);
}

@end
