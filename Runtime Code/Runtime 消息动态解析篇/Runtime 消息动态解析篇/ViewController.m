//
//  ViewController.m
//  Runtime 消息动态解析篇
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
#import "Animal.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Person *feyddy = [[Person alloc] init];
//    feyddy.name = @"Feyddy";
//    [feyddy eat];
    
    
    Animal *animal = [[Animal alloc] init];
    animal.name = @"老鹰";
    ((void (*)(id, SEL))objc_msgSend)((id)animal, @selector(eat));
}

@end
