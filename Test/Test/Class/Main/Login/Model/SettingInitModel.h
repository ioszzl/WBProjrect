//
//  SettingInitModel.h
//  Test
//
//  Created by eims on 2018/12/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingInitUserLogin :NSObject
@property (nonatomic , copy) NSString              * isDeleted;
@property (nonatomic , assign) NSInteger              status;
@property (nonatomic , assign) NSInteger              userInfoId;
@property (nonatomic , copy) NSString              * pushUserId;
@property (nonatomic , copy) NSString              * headPic;
@property (nonatomic , copy) NSString              * pushCode;
@property (nonatomic , assign) NSInteger              companyId;
@property (nonatomic , assign) NSInteger              userType;
@property (nonatomic , copy) NSString              * defBankId;
@property (nonatomic , assign) NSInteger              qiyeHmdTime;
@property (nonatomic , copy) NSString              * payPwd;
@property (nonatomic , assign) NSInteger              enterpriseType;
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , assign) NSInteger              userHmdTime;
@property (nonatomic , copy) NSString              * pwd;
@property (nonatomic , copy) NSString              * powerName;
@property (nonatomic , copy) NSString              * phone;
@property (nonatomic , copy) NSString              * userName;
@property (nonatomic , assign) NSInteger              createTime;
@property (nonatomic , copy) NSString              * openEnterprise;

@end

@interface SettingInitData :NSObject
@property (nonatomic , copy) NSString              * token;
@property (nonatomic , strong) SettingInitUserLogin              * userLogin;
@property (nonatomic , assign) NSInteger              loginType;

@end

@interface SettingInitModel : BaseModel
@property (nonatomic , strong) SettingInitData              * data;
@end

NS_ASSUME_NONNULL_END
