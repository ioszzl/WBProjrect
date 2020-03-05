//
//  TradeModel.h
//  Test
//
//  Created by eims on 2018/11/17.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Children :NSObject
@property (nonatomic , assign) NSInteger              value;
@property (nonatomic , copy) NSString              * label;
@property (nonatomic , copy) NSArray<Children *>              * children;

@end

@interface TradeModel : BaseModel
@property (nonatomic , copy) NSArray<Children *>              * data;
@end

NS_ASSUME_NONNULL_END
