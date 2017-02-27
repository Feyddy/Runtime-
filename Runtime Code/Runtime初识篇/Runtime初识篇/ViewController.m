//
//  ViewController.m
//  Runtime初识篇
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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 动态创建对象 创建一个Person 继承自 NSObject类
    Class People = objc_allocateClassPair([NSObject class], "Person", 0);
    
    //为该类对象添加NSString *_name成员变量
    class_addIvar(People, "_name", sizeof(NSString*), sizeof(NSString*), @encode(NSString*));
    class_addIvar(People, "_age", sizeof(int), sizeof(int), @encode(int));
    
    //注册一个叫say方法
    SEL s = sel_registerName("say:");
    
    //为该类增加名为say的方法
    class_addMethod(People, s , (IMP)sayFunction, "v@:@");
    
    //注册该类
    objc_registerClassPair(People);
    
    //创建一个了类的实例
    id peopleInstance = [[People alloc] init];
    
    //KVC 动态改变 对象peopleInstance 中的实例变量
    [peopleInstance setValue:@"Feyddy" forKey:@"name"];
    
    //从类中获取成员变量Ivar
    Ivar ageIvar = class_getInstanceVariable(People, "_age");
    
    //为peopleInstance的成员变量赋值
    object_setIvar(peopleInstance, ageIvar, @25);
    
    //调用 peopleInstance 对象中的 s 方法选择器对应的方法
    objc_msgSend(peopleInstance, s, @"大家好!"); // 这样写也可以，请看我博客说明
    /*
     //修改的方法有返回值就用IMP，无返回值就用VIMP
     typedef id   (*_IMP)  (id,SEL,...);
     typedef void (*_VIMP) (id,SEL,...);
     */
    ((void (*)(id,SEL,id))objc_msgSend)(peopleInstance, s, @"大家好");
    
    //当People类或者它的子类的实例还存在，则不能调用objc_disposeClassPair这个方法；因此这里要先销毁实例对象后才能销毁类；
    peopleInstance = nil;
    
    // 销毁类
    objc_disposeClassPair(People);
    
}


// 自定义一个方法
void sayFunction(id self, SEL _cmd, id some) {
    NSLog(@"%@岁的%@说：%@", object_getIvar(self, class_getInstanceVariable([self class], "_age")),[self valueForKey:@"name"],some);
}



@end
