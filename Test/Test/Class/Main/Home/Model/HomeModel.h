//
//  HomeModel.h
//  Test
//
//  Created by eims on 2018/11/19.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BannerList :NSObject
@property (nonatomic , assign) NSInteger              operation_time;
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * file_url;
@property (nonatomic , assign) NSInteger              type;
@property (nonatomic , assign) NSInteger              hidden;

@end

@interface HomeBannerData :NSObject
@property (nonatomic , assign) NSInteger              cityId;//定位城市id
@property (nonatomic , copy) NSArray<NSString *>              * userTtComment;//头条内容
@property (nonatomic , copy) NSArray<BannerList *>              * bannerList;
@property (nonatomic , copy) NSString              * city;//定位城市
@property (nonatomic , assign) NSInteger              hasRealName;//是否需要完善信息(0:需要,1:不需要)

@end


@interface HomeModel : BaseModel
@property (nonatomic , strong) HomeBannerData              * data;
@end



NS_ASSUME_NONNULL_END
