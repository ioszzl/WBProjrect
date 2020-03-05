//
//  NSObject+Category.m
//  Test
//
//  Created by eims on 17/6/22.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.type.code isEqualToString:@"NSString"]) {
        if (oldValue == nil || [oldValue isMemberOfClass:[NSNull class]]) {
            return @"";
        }
    }
    
    return oldValue;
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"describe":@"description",@"ID":@"id"};
}


@end
