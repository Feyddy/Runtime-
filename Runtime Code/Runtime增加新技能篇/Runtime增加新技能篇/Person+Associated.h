//
//  Person+Associated.h
//  Runtime增加新技能篇
//
//  Created by t3 on 2017/2/27.
//  Copyright © 2017年 feyddy. All rights reserved.
//

#import "Person.h"
typedef void (^CodingCallBack)();
@interface Person (Associated)
@property (nonatomic, strong) NSNumber *associatedHeight; // 胸围
@property (nonatomic, copy) CodingCallBack associatedCallBack;  // 写代码

@end
