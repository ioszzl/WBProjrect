//
//  SearchHistoryTableViewCell.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/2.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchHistoryTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIButton *deleteBtn;

@property (nonatomic, copy) void(^deleteBtnBlock)(void);
@end

NS_ASSUME_NONNULL_END
