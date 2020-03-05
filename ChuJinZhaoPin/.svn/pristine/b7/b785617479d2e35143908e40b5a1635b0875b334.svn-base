//
//  SendFailAlertView.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "SendFailAlertView.h"

@implementation SendFailAlertView
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
    
    _imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"投递失败"]];
    [alertV addSubview:_imgV];
    [_imgV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(alertV);
        make.top.mas_offset(Size(46/2));
        make.height.width.mas_equalTo(Size(130/2));
    }];
    
    _titleLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont boldSystemFontOfSize:Size(17)] textColor:COLOR_RGB_51 textAlignment:NSTextAlignmentCenter];
    [alertV addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.equalTo(_imgV.mas_bottom).mas_offset(Size(15));
    }];
    _titleLab.text = @"投递失败";
    
    
    _contentLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(15)] textColor:COLOR_RGB_102 textAlignment:NSTextAlignmentCenter];
    
    [alertV addSubview:_contentLab];
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.right.mas_offset(-Size(15));
        make.top.equalTo(_titleLab.mas_bottom).mas_offset(Size(20));
        make.bottom.mas_offset(-Size(20/2));
    }];
    _contentLab.text = @"信号丢了，麻烦再投递一次~";
    

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
