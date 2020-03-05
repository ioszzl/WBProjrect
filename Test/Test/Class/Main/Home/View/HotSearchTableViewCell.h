//
//  HotSearchTableViewCell.h
//  Test
//
//  Created by eims on 2018/11/2.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserHotSaerchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HotSearchTableViewCell : UITableViewCell
@property (nonatomic, strong) NSArray<UserHotSaerchData *> *dataSource;

@property (nonatomic, copy) void(^itemDidSelectedBlock)(NSString *str,NSInteger index);
@end

NS_ASSUME_NONNULL_END
