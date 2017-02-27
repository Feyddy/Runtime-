//
//  ViewController.m
//  Runtime增加新技能篇
//
//  Created by t3 on 2017/2/27.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Person+Associated.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Person *feyddy = [[Person alloc] init];
    feyddy.name = @"Feyddy";
    feyddy.age = 25;
    [feyddy setValue:@"ios developer" forKey:@"occupation"];
    feyddy.associatedHeight = @175;
    feyddy.associatedCallBack = ^(){
    
        NSLog(@"Feyddy正在写代码~");
    };
    feyddy.associatedCallBack();
    
    NSDictionary *propertyResultDict = [feyddy allProperties];
    for (NSString *propertyName in propertyResultDict.allKeys) {
        NSLog(@"propertyName:%@, propertyValue:%@",propertyName, propertyResultDict[propertyName]);
    }
    
    NSDictionary *methodResultDic = [feyddy allMethods];
    for (NSString *methodName in methodResultDic.allKeys) {
        NSLog(@"methodName:%@, argumentsCount:%@", methodName, methodResultDic[methodName]);
    }
}

@end
