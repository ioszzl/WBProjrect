//
//  CommentDetailModel.h
//  Test
//
//  Created by eims on 2018/11/21.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentDetailList :NSObject
@property (nonatomic , copy) NSString              * real_name;
@property (nonatomic , assign) NSInteger              post_id;
@property (nonatomic , copy) NSString             * totalScore;
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , assign) NSInteger              head_pic_img_id;
@property (nonatomic , copy) NSString              * content;
@property (nonatomic , assign) NSInteger              create_time;
@property (nonatomic , assign) NSInteger              user_id;
@property (nonatomic , assign) NSInteger              real_star;
@property (nonatomic , assign) NSInteger              good_count;
@property (nonatomic , assign) NSInteger              goodCounts;
@property (nonatomic , copy) NSString              * isGood;
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , assign) NSInteger              inter_star;
@property (nonatomic , assign) NSInteger              metting_id;
@property (nonatomic , copy) NSString              * phone;
@property (nonatomic , assign) NSInteger              star_level;
@property (nonatomic , assign) NSInteger              envi_star;
@property (nonatomic , copy) NSString              * headImageUrl;
@property (nonatomic , copy) NSString              * job_name;
@property (nonatomic , copy) NSString              * is_deleted;

@end

@interface CommentDetailComment :NSObject
@property (nonatomic , assign) NSInteger              pageSize;
@property (nonatomic , assign) BOOL              hasNextPage;
@property (nonatomic , assign) NSInteger              pages;
@property (nonatomic , assign) NSInteger              pageNum;
@property (nonatomic , assign) NSInteger              lastPage;
@property (nonatomic , copy) NSArray<NSNumber *>              * navigatepageNums;
@property (nonatomic , assign) BOOL              isLastPage;
@property (nonatomic , assign) NSInteger              total;
@property (nonatomic , copy) NSString              * orderBy;
@property (nonatomic , assign) NSInteger              nextPage;
@property (nonatomic , assign) NSInteger              size;
@property (nonatomic , assign) BOOL              hasPreviousPage;
@property (nonatomic , assign) NSInteger              navigatePages;
@property (nonatomic , assign) NSInteger              startRow;
@property (nonatomic , assign) NSInteger              prePage;
@property (nonatomic , copy) NSArray<CommentDetailList *>              * list;
@property (nonatomic , assign) NSInteger              firstPage;
@property (nonatomic , assign) BOOL              isFirstPage;
@property (nonatomic , assign) NSInteger              endRow;

@end

@interface CommentDetailData :NSObject
@property (nonatomic , strong) CommentDetailComment              * comment;
@property (nonatomic , assign) NSInteger              commentCount;

@end

@interface CommentDetailModel : BaseModel
@property (nonatomic , strong) CommentDetailData              * data;
@end

NS_ASSUME_NONNULL_END
