//
//  CompanyDetailModel.h
//  Test
//
//  Created by eims on 2018/11/21.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CompanyDetailCompanyMap :NSObject
@property (nonatomic , assign) NSInteger              information_status;
@property (nonatomic , copy) NSString              * desCardId;
@property (nonatomic , copy) NSString              * scale_str;
@property (nonatomic , assign) NSInteger              company_area_id;
@property (nonatomic , copy) NSString              * company_type_str;//公司类型
@property (nonatomic , copy) NSString              * company_name;
@property (nonatomic , copy) NSString              * company_email;
@property (nonatomic , copy) NSString              * company_address;//公司地址
@property (nonatomic , copy) NSString              * company_host_url;//官网
@property (nonatomic , copy) NSString              * company_environmental_pic_ids;
@property (nonatomic , copy) NSString              * position_name;
@property (nonatomic , copy) NSString              * logoUrl;//公司logo
@property (nonatomic , copy) NSString              * describ;
@property (nonatomic , copy) NSString              * legal_person;
@property (nonatomic , assign) NSInteger              commentNum;//评论数
@property (nonatomic , copy) NSString              * company_info_remake;
@property (nonatomic , assign) NSInteger              postNum;
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , copy) NSString              * scale;
@property (nonatomic , assign) NSInteger              industry_class_id;
@property (nonatomic , assign) NSInteger              logo;
@property (nonatomic , copy) NSString              * company_describe;//公司简介
@property (nonatomic , assign) NSInteger              company_type;

@end

@interface CompanyDetailScoreMap :NSObject
@property (nonatomic , copy) NSString              * enviStar;//公司环境
@property (nonatomic , copy) NSString              * interStar;//interStar
@property (nonatomic , copy) NSString              * totalStar;//综合评分
@property (nonatomic , copy) NSString              * realStar;//信息真实性

@end

@interface CompanyDetailNumMap :NSObject
@property (nonatomic , assign) NSInteger              collectNum;//多少个求职者关注
@property (nonatomic , copy) NSString              * desCardId;
@property (nonatomic , copy) NSString              * isCollect;//是否关注(y:没关注,n:已关注)

@end

@interface CompanyDetailImageList :NSObject
@property (nonatomic , assign) NSInteger              imageId;
@property (nonatomic , copy) NSString              * imageUrl;

@end

@interface CompanyDetailData :NSObject
@property (nonatomic , strong) CompanyDetailCompanyMap              * companyMap;
@property (nonatomic , copy) NSArray<NSString *>              * describeList;//福利
@property (nonatomic , strong) CompanyDetailScoreMap              * scoreMap;
@property (nonatomic , strong) CompanyDetailNumMap              * NumMap;
@property (nonatomic , copy) NSArray<CompanyDetailImageList *>              * imageList;

@end

@interface CompanyDetailModel : BaseModel
@property (nonatomic , strong) CompanyDetailData              * data;
@end

NS_ASSUME_NONNULL_END
