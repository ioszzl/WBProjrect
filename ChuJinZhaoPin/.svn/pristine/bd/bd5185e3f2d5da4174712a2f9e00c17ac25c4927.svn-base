//
//  SendSuccessAlertView.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "SendSuccessAlertView.h"

@implementation SendSuccessAlertView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    self.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
    
    UIView *alertV = [UIView new];
    alertV.backgroundColor = RGBCOLOR(255, 255, 255);
    alertV.layer.cornerRadius = Size(5);
    [self addSubview:alertV];
    [alertV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(Size(600/2));
        //make.height.mas_equalTo(Size(352/2));
    }];
    
    _titleLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont boldSystemFontOfSize:Size(17)] textColor:COLOR_RGB_51 textAlignment:NSTextAlignmentCenter];
    [alertV addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(Size(16));
    }];
    _titleLab.text = @"投递成功";
    
    UIView *line = [UIView new];
    line.backgroundColor = RGBCOLOR(230, 230, 230);
    [alertV addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.right.mas_offset(0);
        make.top.mas_offset(Size(100/2));
    }];
    
    UILabel *tipsLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:COLOR_RGB_51];
    [alertV addSubview:tipsLab];
    [tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.top.equalTo(line.mas_bottom).mas_offset(Size(20));
    }];
    tipsLab.text = @"温馨提示";
    
    _contentLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:COLOR_RGB_102];
    [alertV addSubview:_contentLab];
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.right.mas_offset(-Size(15));
        make.top.equalTo(tipsLab.mas_bottom).mas_offset(Size(12));
    }];
    _contentLab.numberOfLines = 0;
    _contentLab.text = @"除职位押金外平台不会收取求职者任何其它费用，若企业在聊天中涉及转账缴费，请不要相信并立即向平台反映。";
    
    [alertV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_contentLab.mas_bottom).mas_offset(Size(56/2));
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if ([touch.view isEqual:self]) {
        self.hidden = YES;
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
