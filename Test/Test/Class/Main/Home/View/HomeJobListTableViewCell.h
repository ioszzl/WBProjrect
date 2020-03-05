//
//  HomeJobListTableViewCell.h
//  Test
//
//  Created by eims on 2018/11/1.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeIndexListModel.h"
#import "RecruitJobModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeJobListTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *jobNameLab;
@property (nonatomic, strong) UILabel *moneyLab;
@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UIImageView *logoImgV;
@property (nonatomic, strong) UILabel *companyLab;
@property (nonatomic, strong) UILabel *scoreLab;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, strong) NSMutableArray<UIImageView *> *starImgVArr;
@property (nonatomic, strong) NSMutableArray<UILabel *> *tagLabArr;

@property (nonatomic, strong) UILabel *meterLab;
@property (nonatomic, strong) UIButton *addressBtn;
@property (nonatomic, copy) void(^addressBtnBlock)(UIButton *btn);

@property (nonatomic, strong) HomeIndexList *model;

@property (nonatomic, strong) RecruitJobList *list;
@end

NS_ASSUME_NONNULL_END
