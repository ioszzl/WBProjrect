//
//  JobContentTableViewCell.h
//  Test
//
//  Created by zzl on 2018/11/4.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobContentTableViewCell : UITableViewCell
@property(nonatomic,strong) UILabel *titleLab;
@property(nonatomic,strong) UILabel *contentLab;
@property(nonatomic,strong) UIView *line;
@property (nonatomic, strong) UIButton *editBtn;

@property (nonatomic, copy) void(^editBtnBlock)(void);
@end

NS_ASSUME_NONNULL_END
