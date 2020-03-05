//
//  JobDetailModel.m
//  Test
//
//  Created by eims on 2018/11/20.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "JobDetailModel.h"

@implementation JobDetailModel

@end
@implementation JobDetailImageList

@end
@implementation JobDetailComment

@end
@implementation JobDetailScoreMap

@end
@implementation JobDetailCompanyMap

@end
@implementation JobDetailData
+(NSDictionary *)mj_objectClassInArray{
    return @{@"comment":[JobDetailComment class],
             @"imageList":[JobDetailImageList class]
                 };
}
@end
