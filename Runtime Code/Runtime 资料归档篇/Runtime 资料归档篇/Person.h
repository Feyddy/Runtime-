//
//  Person.h
//  Runtime 资料归档篇
//
//  Created by t3 on 2017/2/27.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name; // 姓名
@property (nonatomic, strong) NSNumber *age; // 年龄
@property (nonatomic, copy) NSString *occupation; // 职业
@property (nonatomic, copy) NSString *nationality; // 国籍
@end
