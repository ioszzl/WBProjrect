//
//  RecruitJobModel.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/22.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface RecruitJobList :NSObject
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , assign) NSInteger              education_level;
@property (nonatomic , assign) NSInteger              company_id;
@property (nonatomic , copy) NSString              * job_name;//职位名称
@property (nonatomic , copy) NSString              * push_time;//发布时间
@property (nonatomic , assign) NSInteger              work_address_region_id;
@property (nonatomic , copy) NSString              * describ;//行业类别
@property (nonatomic , copy) NSString              * work_region;//区域
@property (nonatomic , copy) NSString              * isApply;
@property (nonatomic , copy) NSString              * education_level_str;//学历
@property (nonatomic , copy) NSString              * show_range;//显示薪资
@property (nonatomic , assign) NSInteger              work_year;

@end

@interface RecruitJobData :NSObject
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
@property (nonatomic , copy) NSArray<RecruitJobList *>              * list;
@property (nonatomic , assign) NSInteger              firstPage;
@property (nonatomic , assign) BOOL              isFirstPage;
@property (nonatomic , assign) NSInteger              endRow;

@end


@interface RecruitJobModel : BaseModel
@property (nonatomic , strong) RecruitJobData              * data;
@end

NS_ASSUME_NONNULL_END
