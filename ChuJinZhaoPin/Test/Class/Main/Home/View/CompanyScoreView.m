//
//  CompanyScoreView.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "CompanyScoreView.h"

@implementation CompanyScoreView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    UIView *bgV = [UIView new];
    bgV.backgroundColor = RGBCOLOR(255, 255, 255);
    [self addSubview:bgV];
    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_offset(Size(10));
        make.right.bottom.mas_offset(-Size(10));
    }];
    
    _iconV = [UIImageView new];
    _iconV.contentMode = UIViewContentModeScaleAspectFit;
    [bgV addSubview:_iconV];
    [_iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_offset(5);
        make.width.height.mas_equalTo(Size(92/2));
    }];
    
    _nameLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:COLOR_RGB_51];
    [bgV addSubview:_nameLab];
    _nameLab.adjustsFontSizeToFitWidth = YES;
    _nameLab.numberOfLines = 1;
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconV.mas_right).mas_offset(Size(5));
        make.top.mas_offset(Size(11));
        make.height.mas_equalTo(Size(15));
        make.width.mas_lessThanOrEqualTo(Size(350/2));
    }];
    
    
    _countLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_12 textColor:COLOR_RGB_153];
    [bgV addSubview:_countLab];
    [_countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLab.mas_right).mas_offset(Size(10));
        make.centerY.equalTo(_nameLab);
    }];
    
    
    UIImageView *tempImgV;
    for (int i = 0; i<5; i++) {
        UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"职位详情-收藏01"]];
        [bgV addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!tempImgV) {
                make.left.equalTo(_nameLab);
                make.top.equalTo(_nameLab.mas_bottom).mas_offset(Size(7));
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
    [bgV addSubview:_scoreLab];
    [_scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLab).mas_offset(Size(11+4)*5+Size(4));
        make.top.equalTo(_nameLab.mas_bottom).mas_offset(Size(7));
    }];
    
    
    UIImageView *arrowV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"left_icon"]];
    [bgV addSubview:arrowV];
    [arrowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(21));
        make.centerY.mas_equalTo(self);
    }];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap:)];
    [self addGestureRecognizer:tap];
    
//    _iconV.image = [UIImage imageNamed:@"附近职位logo"];
//    _nameLab.text = @"好未来";
//    _countLab.text = @"在招职位80个";
//    _scoreLab.text = @"4.4分";
}
-(void)setScore:(NSString *)score{
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
-(void)doTap:(UITapGestureRecognizer *)tap{
    BLOCK_EXEC(self.tapBlock);
}

-(NSMutableArray<UIImageView *> *)starImgArr{
    if (!_starImgArr) {
        _starImgArr = [NSMutableArray array];
    }
    return _starImgArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
