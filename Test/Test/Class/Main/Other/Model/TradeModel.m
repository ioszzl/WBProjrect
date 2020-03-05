//
//  TradeModel.m
//  Test
//
//  Created by eims on 2018/11/17.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "TradeModel.h"

@implementation TradeModel
+(NSDictionary *)mj_objectClassInArray{
    return @{@"data":[Children class]};
}
@end
@implementation Children
+(NSDictionary *)mj_objectClassInArray{
    return @{@"children":[Children class]};
}
@end

