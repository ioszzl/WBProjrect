//
//  RecruitJobModel.m
//  Test
//
//  Created by eims on 2018/11/22.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "RecruitJobModel.h"

@implementation RecruitJobModel

@end

@implementation RecruitJobList

@end

@implementation RecruitJobData
+(NSDictionary *)mj_objectClassInArray{
    return @{@"list":[RecruitJobList class]};
}
@end
