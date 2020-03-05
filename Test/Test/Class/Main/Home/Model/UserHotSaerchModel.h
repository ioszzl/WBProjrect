//
//  UserHotSaerchModel.h
//  Test
//
//  Created by eims on 2018/11/20.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserHotSaerchData :NSObject
@property (nonatomic , copy) NSString              * searchName;
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , assign) NSInteger              searchType;
@property (nonatomic , assign) NSInteger              searchNum;

@end


@interface UserHotSaerchModel : BaseModel
@property (nonatomic , copy) NSArray<UserHotSaerchData *>              * data;
@end

NS_ASSUME_NONNULL_END
