//
//  CompanyDetailView.m
//  Test
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "CompanyDetailView.h"
@interface CompanyDetailView()
@property (nonatomic, strong) UIView *markBgV;
@end
@implementation CompanyDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    self.backgroundColor = RGBCOLOR(255, 255, 255);
    
    UIView *colorView = [UIView new];
    colorView.backgroundColor = COLOR_MAIN;
    [self addSubview:colorView];
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
        make.height.mas_equalTo(Size(250/2));
    }];
    
    UIView *bgV = [UIView new];
    bgV.backgroundColor = RGBCOLOR(255, 255, 255);
    bgV.layer.shadowColor = COLOR_RGB_51.CGColor;
    bgV.layer.shadowOpacity = 0.2f;
    //    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRect:bgV.bounds];
    //    bgV.layer.shadowPath = maskPath1.CGPath;
    bgV.layer.shadowOffset = CGSizeMake(0, 0.5);
    bgV.layer.cornerRadius = Size(5);
    [self addSubview:bgV];
    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.right.mas_offset(-Size(15));
        make.top.mas_offset(Size(186/2));
        make.height.mas_equalTo(Size(446/2));
    }];
    
    _logoImgV = [UIImageView new];
    [bgV addSubview:_logoImgV];
    [_logoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(-Size(73/2));
        make.height.width.mas_equalTo(Size(136/2));
        make.centerX.equalTo(bgV);
    }];
    _logoImgV.layer.borderColor = COLOR_RGB_line.CGColor;
    _logoImgV.layer.borderWidth = 0.5;
    _logoImgV.layer.cornerRadius = Size(5);
    _logoImgV.clipsToBounds = YES;
    
    _focusCountLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_12 textColor:RGBCOLOR(255, 255, 255)];
    [bgV addSubview:_focusCountLab];
    [_focusCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_logoImgV.mas_right).mas_offset(Size(16));
        make.bottom.equalTo(bgV.mas_top).mas_offset(-Size(5));
    }];
    
    
    _focusBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"关注企业" backgroundColor:nil titleColor:COLOR_RGB_102 titleSize:Size(13)];
    [bgV addSubview:_focusBtn];
    [_focusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_logoImgV.mas_right).mas_offset(Size(40));
        make.top.mas_offset(Size(8));
    }];
    [_focusBtn addTarget:self action:@selector(doFocusBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    _nameLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(16)] textColor:COLOR_RGB_51];
    [bgV addSubview:_nameLab];
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_logoImgV);
        make.top.equalTo(_logoImgV.mas_bottom).mas_offset(Size(12));
    }];
    
    
    
    UIView *markBgV = [UIView new];
    [bgV addSubview:markBgV];
    [markBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgV);
        make.top.equalTo(_nameLab.mas_bottom).mas_offset(Size(15));
    }];
    self.markBgV = markBgV;
    
    
    UIView *scoreBgV = [UIView new];
    scoreBgV.backgroundColor = COLOR_BG;
    [bgV addSubview:scoreBgV];
    [scoreBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.equalTo(markBgV.mas_bottom).mas_offset(Size(15));
        make.height.mas_equalTo(Size(68/2));
    }];
    
    UILabel *scoreItemLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(13)] textColor:COLOR_RGB_102];
    [scoreBgV addSubview:scoreItemLab];
    [scoreItemLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(62/2));
        make.centerY.equalTo(scoreBgV);
    }];
    scoreItemLab.text = @"综合评分";
    
    UIImageView *tempImgV;
    for (int i = 0; i<5; i++) {
        UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"职位详情-收藏01"]];
        [scoreBgV addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!tempImgV) {
                make.left.equalTo(scoreItemLab.mas_right).mas_offset(Size(68/2));
                make.centerY.equalTo(scoreBgV);
            }else{
                make.left.equalTo(tempImgV.mas_right).mas_offset(Size(4));
                make.top.equalTo(tempImgV);
            }
            make.width.height.mas_equalTo(Size(23/2));
            
        }];
        tempImgV = imgV;
        [self.starImgArr addObject:imgV];
    }
    
    _scoreLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(11)] textColor:COLOR_RGB_153];
    [scoreBgV addSubview:_scoreLab];
    [_scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(scoreItemLab.mas_right).mas_offset(Size(66/2)+Size(11+4)*5+Size(4));
        make.centerY.equalTo(scoreBgV);
    }];
    
    
    UILabel *messageLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:COLOR_RGB_51 textAlignment:NSTextAlignmentCenter];
    [bgV addSubview:messageLab];
    messageLab.text = @"信息真实性";
    
    UILabel *environmentLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:COLOR_RGB_51 textAlignment:NSTextAlignmentCenter];
    [bgV addSubview:environmentLab];
    environmentLab.text = @"公司环境";
    
    UILabel *interviewerLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:COLOR_RGB_51 textAlignment:NSTextAlignmentCenter];
    [bgV addSubview:interviewerLab];
    interviewerLab.text = @"面试官";
    
    NSArray *labArr = @[messageLab,environmentLab,interviewerLab];
    [labArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [labArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scoreBgV.mas_bottom).mas_offset(Size(15));
    }];
    
    _messageScoreLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(17)] textColor:COLOR_MAIN];
    [bgV addSubview:_messageScoreLab];
    [_messageScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(messageLab.mas_bottom).mas_offset(Size(15));
        make.centerX.equalTo(messageLab);
    }];
    
    
    _environmentScoreLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(17)] textColor:COLOR_MAIN];
    [bgV addSubview:_environmentScoreLab];
    [_environmentScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(environmentLab.mas_bottom).mas_offset(Size(15));
        make.centerX.equalTo(environmentLab);
    }];
    
    
    _interviewerScoreLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(17)] textColor:COLOR_MAIN];
    [bgV addSubview:_interviewerScoreLab];
    [_interviewerScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(interviewerLab.mas_bottom).mas_offset(Size(15));
        make.centerX.equalTo(interviewerLab);
    }];
    
    
    
    
    //initWithImage:[UIImage imageNamed:@"附近职位logo"]];
//    _focusCountLab.text = @"128个求职者已关注";
//    _nameLab.text = @"好未来";
//    _scoreLab.text = @"4.4分";
//    _messageScoreLab.text = @"5.0";
//    _environmentScoreLab.text = @"4.9";
//    _interviewerScoreLab.text = @"4.8";
}

- (void)setMarkArr:(NSArray *)markArr{
    _markArr = markArr;
    if (_markArr.count != 0) {
        for (UIView *v in _markBgV.subviews) {
            [v removeFromSuperview];
        }
    }
    //NSArray *markArr = @[@"五险一金",@"",@"年终奖"];
    UILabel *tempLab;
    for (int i=0; i<markArr.count; i++) {
        
        UILabel *lab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_12 textColor:COLOR_RGB_153 textAlignment:NSTextAlignmentCenter];
        [_markBgV addSubview:lab];
        lab.text = markArr[i];
        lab.backgroundColor = COLOR_BG;
        lab.layer.cornerRadius = Size(5);
        lab.clipsToBounds = YES;
        CGFloat w = [markArr[i] ym_getStringWidthfont:FONT_SIZE_12] + Size(16);
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(w);
            make.height.mas_equalTo(Size(18));
            if (!tempLab) {
                make.left.mas_offset(0);
            }else{
                make.left.equalTo(tempLab.mas_right).mas_offset(Size(8));
            }
            
            if (i == markArr.count-1) {
                make.right.mas_offset(0);
                make.bottom.mas_offset(0);
            }
            make.top.mas_offset(0);
        }];
        
        tempLab = lab;
    }
}

- (void)setScore:(NSString *)score{
    _score = score;
    
    CGFloat s = score.floatValue;
    for (int i = 0; i<5; i++) {
        if (i<floorf(s)) {
            self.starImgArr[i].image = [UIImage imageNamed:@"职位详情-收藏02"];
        }else{
            self.starImgArr[i].image = [UIImage imageNamed:@"职位详情-收藏01"];
        }
    }
    if (s - floorf(s) == 0) {
        
    }else{
        [self.starImgArr objectAtIndex:(NSUInteger )(ceilf(s)-1)].image = [UIImage imageNamed:@"半颗心"];
    }
}
-(NSMutableArray<UIImageView *> *)starImgArr{
    if (!_starImgArr) {
        _starImgArr = [NSMutableArray array];
    }
    return _starImgArr;
}

-(void)doFocusBtn:(UIButton *)btn{
    BLOCK_EXEC(self.focusBtnBlock,btn);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
