//
//  LoginModel.h
//  TestDemo
//
//  Created by eims on 2018/6/25.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import "BaseModel.h"
@class LoginReturnMap,ParkList;
@interface LoginModel : BaseModel
@property (nonatomic , strong) LoginReturnMap              * returnMap;
@end

@interface ParkList :NSObject
@property (nonatomic , copy) NSString              * park_url;//园区地址
@property (nonatomic , copy) NSString              * park_name;//园区名称

@end

@interface LoginReturnMap :NSObject
@property (nonatomic , copy) NSString              * phone;//手机号
@property (nonatomic , copy) NSArray<ParkList *>              * parkList;//园区

@end
