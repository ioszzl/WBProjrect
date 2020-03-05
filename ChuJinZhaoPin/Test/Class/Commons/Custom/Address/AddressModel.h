//
//  AddressModel.h
//  yidianjiankang
//
//  Created by eims on 17/3/23.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <Foundation/Foundation.h>

/*省市区模型*/
@class ProvinceData,CityData,AreaData;

@interface AddressModel : NSObject

@property (nonatomic, strong) NSArray<ProvinceData *> *data;

@end
@interface ProvinceData : NSObject

@property (nonatomic, assign) NSUInteger ID;

@property (nonatomic, strong) NSArray<CityData *> *data;

@property (nonatomic, copy) NSString *name;

@end

@interface CityData : NSObject

@property (nonatomic, assign) NSUInteger ID;

@property (nonatomic, strong) NSArray<AreaData *> *data;

@property (nonatomic, copy) NSString *name;

@end

@interface AreaData : NSObject

@property (nonatomic, assign) NSUInteger ID;

@property (nonatomic, copy) NSString *name;


@end
