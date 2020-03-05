//
//  LocationModel.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/19.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

//定位 model
@interface LocationPoint :NSObject
@property (nonatomic , copy) NSString              * y;
@property (nonatomic , copy) NSString              * x;

@end

@interface LocationAddressDetail :NSObject
@property (nonatomic , copy) NSString              * district;
@property (nonatomic , copy) NSString              * street_number;
@property (nonatomic , copy) NSString              * street;
@property (nonatomic , copy) NSString              * province;
@property (nonatomic , assign) NSInteger              city_code;
@property (nonatomic , copy) NSString              * city;

@end

@interface LocationContent :NSObject
@property (nonatomic , strong) LocationPoint              * point;
@property (nonatomic , copy) NSString              * address;
@property (nonatomic , strong) LocationAddressDetail              * address_detail;

@end

@interface LocationData :NSObject
@property (nonatomic , strong) LocationContent              * content;
@property (nonatomic , assign) NSInteger              status;
@property (nonatomic , copy) NSString              * address;

@end
@interface LocationModel : BaseModel
@property (nonatomic , strong) LocationData              * data;
@end

NS_ASSUME_NONNULL_END
