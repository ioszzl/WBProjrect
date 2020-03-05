//
//  AddressModel.m
//  yidianjiankang
//
//  Created by eims on 17/3/23.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "AddressModel.h"

@implementation AddressModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [ProvinceData class]};
}
@end


@implementation ProvinceData
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"value",@"name":@"label",@"data":@"children"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [CityData class]};
}

@end


@implementation CityData
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"value",@"name":@"label",@"data":@"children"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [AreaData class]};
}

@end


@implementation AreaData
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"value",@"name":@"label"};
}
@end


