//
//  CompanyIntroTableViewCell.h
//  Test
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CompanyIntroTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIButton *websitBtn;
@property (nonatomic, copy) void(^websitBtnBlock)(UIButton *btn);
@property (nonatomic, copy) void(^queryBtnBlock)(void);
@end

NS_ASSUME_NONNULL_END
