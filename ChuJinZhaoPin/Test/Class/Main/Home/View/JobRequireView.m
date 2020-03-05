//
//  JobRequireView.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/2.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "JobRequireView.h"

@implementation JobRequireView
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
        make.edges.equalTo(self);
    }];
    
    _nameLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont boldSystemFontOfSize:Size(15)] textColor:COLOR_RGB_51];
    [bgV addSubview:_nameLab];
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.top.mas_offset(Size(20));
    }];
    
    
    _moneyLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont boldSystemFontOfSize:Size(15)] textColor:RGBCOLOR(255, 101, 64)];
    [bgV addSubview:_moneyLab];
    [_moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(Size(-15));
        make.top.mas_offset(Size(20));
    }];
    
    
    UIImageView *yearImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"工作年限"]];
    yearImgV.contentMode = UIViewContentModeScaleAspectFit;
    [bgV addSubview:yearImgV];
    [yearImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.top.equalTo(_nameLab.mas_bottom).mas_offset(Size(37/2));
        make.width.mas_equalTo(Size(28/2));
        make.height.mas_equalTo(Size(34/2));
    }];
    
    _yearLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:RGBCOLOR(102, 102, 102)];
    _yearLab.numberOfLines = 1;
    [bgV addSubview:_yearLab];
    [_yearLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(yearImgV.mas_right).mas_offset(Size(6));
        make.centerY.equalTo(yearImgV);
    }];
    
    
    UIImageView *educationImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"学历"]];
    educationImgV.contentMode = UIViewContentModeScaleAspectFit;
    [bgV addSubview:educationImgV];
    [educationImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_yearLab.mas_right).mas_offset(Size(13));
        make.centerY.equalTo(_yearLab);
        make.width.mas_equalTo(Size(28/2));
        make.height.mas_equalTo(Size(34/2));
    }];
    
    _educationLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:RGBCOLOR(102, 102, 102)];
    _educationLab.numberOfLines = 1;
    [bgV addSubview:_educationLab];
    [_educationLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(educationImgV.mas_right).mas_offset(Size(6));
        make.centerY.equalTo(educationImgV);
    }];
    
    
    UIImageView *tradeImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"行业"]];
    tradeImgV.contentMode = UIViewContentModeScaleAspectFit;
    [bgV addSubview:tradeImgV];
    [tradeImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_educationLab.mas_right).mas_offset(Size(13));
        make.centerY.equalTo(_educationLab);
        make.width.mas_equalTo(Size(28/2));
        make.height.mas_equalTo(Size(34/2));
    }];
    
    _tradeLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:RGBCOLOR(102, 102, 102)];
    _tradeLab.numberOfLines = 1;
    [bgV addSubview:_tradeLab];
    [_tradeLab setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [_tradeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tradeImgV.mas_right).mas_offset(Size(6));
        make.centerY.equalTo(tradeImgV);
        make.right.mas_lessThanOrEqualTo(-Size(233/2));
    }];
    
    
    _payLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:RGBCOLOR(255, 101, 64)];
    [bgV addSubview:_payLab];
    [_payLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(15));
        make.top.equalTo(_moneyLab.mas_bottom).mas_offset(Size(36/2));
    }];
    
    
    UILabel *depositLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:RGBCOLOR(102, 102, 102)];
    [bgV addSubview:depositLab];
    [depositLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_payLab.mas_left).mas_offset(-Size(5));
        make.centerY.equalTo(_payLab);
    }];
    depositLab.text = @"职位押金:";
    self.depositLab = depositLab;
    
    UIView *line = [UIView new];
    line.backgroundColor = RGBCOLOR(230, 230, 230);
    [bgV addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.right.mas_offset(0);
        make.bottom.mas_offset(-Size(70/2));
    }];
    
    UIImageView *positIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"职位详情-定位"]];
    [bgV addSubview:positIcon];
    [positIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(30/2));
        make.centerY.equalTo(bgV.mas_bottom).mas_offset(-Size(70/4));
        make.width.mas_equalTo(Size(12));
        make.height.mas_equalTo(Size(16));
    }];
    
    _addressLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_12 textColor:COLOR_RGB_153];
    _addressLab.numberOfLines = 2;
    [bgV addSubview:_addressLab];
    [_addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(positIcon.mas_right).mas_offset(Size(5));
        make.centerY.equalTo(positIcon);
        make.right.mas_offset(-Size(233/2));
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doAddressTap)];
    [_addressLab addGestureRecognizer:tap];
    _addressLab.userInteractionEnabled = YES;
    
    
    _callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_callBtn setImage:[UIImage imageNamed:@"职位详情-电话"] forState:UIControlStateNormal];
    [bgV addSubview:_callBtn];
    [_callBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(Size(-10));
        make.centerY.equalTo(bgV.mas_bottom).mas_offset(-Size(70/4));
    }];
    [_callBtn addTarget:self action:@selector(doCallBtn) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *labArr = @[@"",@"",@"",@"",@""];
    UILabel *tempLab;
    for (int i=0; i<labArr.count; i++) {
        UILabel *lab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_12 textColor:COLOR_RGB_153 textAlignment:NSTextAlignmentCenter];
        lab.backgroundColor = COLOR_BG;
        lab.layer.cornerRadius = Size(5);
        [bgV addSubview:lab];
        lab.text = labArr[i];
        //CGFloat w = [labArr[i] ym_getStringWidthfont:FONT_SIZE_12] + Size(8);
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!tempLab) {
                make.left.mas_offset(Size(15));
            }else{
                make.left.equalTo(tempLab.mas_right).mas_offset(Size(7));
            }
            make.top.equalTo(yearImgV.mas_bottom).mas_offset(Size(9));
            //make.width.mas_equalTo(w);
            make.height.mas_equalTo(Size(36/2));
        }];
        
        tempLab = lab;
        [self.tagLabArr addObject:lab];
    }
    
    
//    _nameLab.text = @"产品经理";
//    _moneyLab.text = @"7~9K";
//    _yearLab.text = @"1-3年";
//    _educationLab.text = @"本科";
//    _tradeLab.text = @"移动互联网";
//    _payLab.text = @"¥20";
//    _addressLab.text = @"北京市 海淀区中关村科贸电子城7层";
    
    
    
}
-(void)setMarkArr:(NSArray *)markArr{
    _markArr = markArr;
    
    for (int i=0; i<markArr.count; i++) {
        self.tagLabArr[i].text = markArr[i];
        [self.tagLabArr[i] mas_updateConstraints:^(MASConstraintMaker *make) {
            
            if (i == markArr.count-1) {
                make.width.mas_equalTo([self.tagLabArr[i].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10)).priorityHigh();
                make.right.mas_lessThanOrEqualTo(Size(15));
            }else{
                make.width.mas_equalTo([self.tagLabArr[i].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10));
            }
        }];
    }
    
}

- (NSMutableArray<UILabel *> *)tagLabArr{
    if (!_tagLabArr) {
        _tagLabArr = [NSMutableArray array];
    }
    return _tagLabArr;
}
-(void)doCallBtn{
    BLOCK_EXEC(self.callBtnBlock);
}

-(void)doAddressTap{
    BLOCK_EXEC(self.addressTapBlock);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
