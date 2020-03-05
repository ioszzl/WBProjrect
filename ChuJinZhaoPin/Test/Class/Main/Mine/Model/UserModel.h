//
//  UserModel.h
//  TestDemo
//
//  Created by eims on 2018/6/25.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import "BaseModel.h"
@interface UserModel : BaseModel
@property (nonatomic, strong) NSString *head;   // http://d2.cto3.shovesoft.com/file_upload/images/20180519/201805190928127132.jpg
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;

@property (nonatomic, strong) NSString *userId;

@property (nonatomic, strong) NSString *company;
@property (nonatomic, assign) NSInteger loginCode;//0:(无)  1:(无)   2:企业认证 3:企业完善信息

@end
