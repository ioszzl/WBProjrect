//
//  CompanyDetailView.h
//  Test
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CompanyDetailView : UIView
@property (nonatomic, strong) UIImageView *logoImgV;
@property (nonatomic, strong) UILabel *focusCountLab;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *scoreLab;
@property (nonatomic, copy) NSString *score;

@property (nonatomic, strong) NSMutableArray<UIImageView *> *starImgArr;
@property (nonatomic, strong) UIButton *focusBtn;

@property (nonatomic, strong) NSArray *markArr;

@property (nonatomic, strong) UILabel *messageScoreLab;
@property (nonatomic, strong) UILabel *environmentScoreLab;
@property (nonatomic, strong) UILabel *interviewerScoreLab;

@property (nonatomic, copy) void(^focusBtnBlock)(UIButton *btn);
@end

NS_ASSUME_NONNULL_END
