//
//  FilterModel.h
//  Test
//
//  Created by eims on 2018/11/17.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Scale :NSObject
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , copy) NSString              * value;

@end

@interface FilterData :NSObject
@property (nonatomic , copy) NSArray<Scale *>              * companyType;
@property (nonatomic , copy) NSArray<Scale *>              * companyWorkYear;
@property (nonatomic , copy) NSArray<Scale *>              * eduLevel;
@property (nonatomic , copy) NSArray<Scale *>              * salary;
@property (nonatomic , copy) NSArray<Scale *>              * userWorkYear;
@property (nonatomic , copy) NSArray<Scale *>              * scale;

@end
@interface FilterModel : BaseModel
@property (nonatomic , strong) FilterData              * data;

@end

NS_ASSUME_NONNULL_END
