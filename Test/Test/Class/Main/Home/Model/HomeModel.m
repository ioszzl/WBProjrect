//
//  HomeModel.m
//  Test
//
//  Created by eims on 2018/11/19.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

@end
@implementation BannerList

@end
@implementation HomeBannerData
+(NSDictionary *)mj_objectClassInArray{
    return @{@"bannerList":[BannerList class]};
}
@end
