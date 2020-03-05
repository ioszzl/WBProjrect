//
//  JobDetailModel.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/20.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobDetailImageList :NSObject
@property (nonatomic , assign) NSInteger              imageId;
@property (nonatomic , copy) NSString              * imageUrl;

@end

@interface JobDetailComment :NSObject
@property (nonatomic , copy) NSString              * is_deleted;
@property (nonatomic , assign) NSInteger              post_id;
@property (nonatomic , copy) NSString             * totalScore;
@property (nonatomic , copy) NSString              * job_name;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , assign) NSInteger              head_pic_img_id;
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , assign) NSInteger              create_time;
@property (nonatomic , assign) NSInteger              user_id;
@property (nonatomic , assign) NSInteger              real_star;
@property (nonatomic , assign) NSInteger              good_count;
@property (nonatomic , assign) NSInteger              goodCounts;
@property (nonatomic , copy) NSString              * isGood;//是否点赞(y否,n是)
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , assign) NSInteger              inter_star;
@property (nonatomic , assign) NSInteger              metting_id;
@property (nonatomic , copy) NSString              * phone;
@property (nonatomic , assign) NSInteger              star_level;
@property (nonatomic , assign) NSInteger              envi_star;
@property (nonatomic , copy) NSString              * headImageUrl;
@property (nonatomic , copy) NSString              * real_name;
@property (nonatomic , copy) NSString              * content;

@end

@interface JobDetailScoreMap :NSObject
@property (nonatomic , copy) NSString              * enviStar;
@property (nonatomic , copy) NSString              * interStar;
@property (nonatomic , copy) NSString              * totalStar;
@property (nonatomic , copy) NSString              * realStar;

@end

@interface JobDetailCompanyMap :NSObject
@property (nonatomic , assign) NSInteger              information_status;
@property (nonatomic , copy) NSString              * desCardId;
@property (nonatomic , assign) NSInteger              company_area_id;
@property (nonatomic , copy) NSString              * company_name;
@property (nonatomic , copy) NSString              * company_email;
@property (nonatomic , copy) NSString              * company_address;
@property (nonatomic , copy) NSString              * company_host_url;
@property (nonatomic , copy) NSString              * company_environmental_pic_ids;
@property (nonatomic , copy) NSString              * position_name;
@property (nonatomic , copy) NSString              * logoUrl;
@property (nonatomic , copy) NSString              * describ;
@property (nonatomic , copy) NSString              * legal_person;
@property (nonatomic , strong) JobDetailScoreMap              * scoreMap;
@property (nonatomic , copy) NSString              * company_info_remake;
@property (nonatomic , assign) NSInteger              postNum;
@property (nonatomic , assign) NSInteger              commentNum;
@property (nonatomic , copy) NSString              * scale;
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , assign) NSInteger              industry_class_id;
@property (nonatomic , assign) NSInteger              logo;
@property (nonatomic , copy) NSString              * company_describe;
@property (nonatomic , assign) NSInteger              company_type;
@property (nonatomic, copy) NSString               *phone;
@end

@interface JobDetailData :NSObject
@property (nonatomic , copy) NSString              * des_card_ids;
@property (nonatomic , copy) NSString              * pay_plan;
@property (nonatomic , assign) NSInteger              work_year;
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , copy) NSString              * company_address;
@property (nonatomic , copy) NSString              * is_collect;
@property (nonatomic , copy) NSArray<JobDetailImageList *>              * imageList;
@property (nonatomic , copy) NSString              * industry_class;
@property (nonatomic , assign) NSInteger              commentCount;
@property (nonatomic , copy) NSString              * work_time;
@property (nonatomic , assign) NSInteger              company_id;
@property (nonatomic , copy) NSString              * bed_situation;
@property (nonatomic , copy) NSArray<JobDetailComment *>              * comment;
@property (nonatomic , copy) NSString              * social_good;
@property (nonatomic , assign) NSInteger              com_user_id;
@property (nonatomic , copy) NSString              * is_deleted;
@property (nonatomic , copy) NSArray<NSString *>              * fl;
@property (nonatomic , copy) NSString              * job_duty;
@property (nonatomic , assign) NSInteger              industry_class_id;
@property (nonatomic , copy) NSString              * other_good;
@property (nonatomic , copy) NSString              * job_name;
@property (nonatomic , assign) NSInteger              create_time;
@property (nonatomic , strong) JobDetailCompanyMap              * companyMap;
@property (nonatomic , copy) NSString              * total_pay;
@property (nonatomic , copy) NSString              * shareUrl;
@property (nonatomic , copy) NSString              * work_requirement;
@property (nonatomic , assign) NSInteger              education_level;
@property (nonatomic , assign) NSInteger              min_value;
@property (nonatomic , assign) NSInteger              post_money_open;
@property (nonatomic , assign) NSInteger              post_money;
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * basic_pay;
@property (nonatomic , assign) NSInteger              max_value;
@property (nonatomic , assign) NSInteger              collect_count;
@property (nonatomic , copy) NSString              * show_range;
@property (nonatomic , copy) NSString              * company_environmental_pic_ids;
@property (nonatomic , copy) NSString              * work_address_region;
@property (nonatomic , assign) NSInteger              salary_range_id;
@property (nonatomic , assign) NSInteger              work_address_region_id;
@property (nonatomic , copy) NSString              * work_style;
@property (nonatomic , copy) NSString              * company_name;
@property (nonatomic , assign) NSInteger              push_time;
@property (nonatomic , copy) NSString              * food_situation;
@property (nonatomic , copy) NSString              * is_apply;
@property (nonatomic , copy) NSString              * department;

@end

@interface JobDetailModel : BaseModel
@property (nonatomic , strong) JobDetailData              * data;
@end

NS_ASSUME_NONNULL_END
