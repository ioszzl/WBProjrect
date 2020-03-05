//
//  CommentDetailModel.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/21.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "CommentDetailModel.h"

@implementation CommentDetailModel

@end
@implementation CommentDetailList

@end
@implementation CommentDetailComment
+(NSDictionary *)mj_objectClassInArray{
    return @{@"list":[CommentDetailList class]};
}
@end
@implementation CommentDetailData

@end
