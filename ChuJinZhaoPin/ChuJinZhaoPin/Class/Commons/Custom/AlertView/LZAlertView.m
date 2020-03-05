//
//  LZAlertView.m
//  TestDemo
//
//  Created by eims on 2018/6/21.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import "LZAlertView.h"
@interface LZAlertView()
@property (nonatomic, strong) UIView *alertBgView;
@property (nonatomic, strong) UILabel *messageLab;
@end
@implementation LZAlertView



+(instancetype)LZAlertViewWithTitle:(NSString *)title message:(NSString *)message btnArr:(NSArray *)btnArr BtnBlock:(void(^)(NSInteger index))block{
    LZAlertView *alert = [[LZAlertView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    alert.titleLabel.text = title;
    alert.message = message;
    alert.btnArr = btnArr;
    alert.buttonClick = block;
    
    return alert;
}

-(void)initUI{
    CGFloat width = Size(601/2);
    
    self.alertBgView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth/2 - width/2, Size(268/2), width, Size(412/2))];
    self.alertBgView.centerY = kScreenHeight/2;
    self.alertBgView.backgroundColor = [UIColor whiteColor];
    self.alertBgView.layer.masksToBounds = YES;
    self.alertBgView.layer.cornerRadius = Size(5);
    [self addSubview:self.alertBgView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(Size(10), 0, width-Size(20), Size(50))];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = HEXRGBCOLOR(0x1b1b1b);
    self.titleLabel.font = [UIFont systemFontOfSize:Size(18)];
    [self.alertBgView addSubview:self.titleLabel];
    
    UILabel *line = [UILabel ym_labLineWithFrame:CGRectMake(Size(32/2), Size(50)-2, width-Size(32), 2)];
    [self.alertBgView addSubview:line];
    
    self.messageLab = [UILabel ym_labelWithFrame:CGRectMake(Size(40), self.titleLabel.bottom+Size(18), width-Size(80), Size(22)) font:[UIFont systemFontOfSize:Size(15)] textColor:HEXRGBCOLOR(0x1b1b1b) textAlignment:NSTextAlignmentCenter];
    [self.alertBgView addSubview:self.messageLab];
}

-(void)setMessage:(NSString *)message{
    _message = message;
    
    CGSize size = [message ym_calculateSize:[UIFont systemFontOfSize:Size(15)] maxWidth:Size(300-80) lineSpacing:Size(8)];
    self.messageLab.height = size.height;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.lineSpacing = Size(8);
    style.alignment = NSTextAlignmentCenter;
    NSAttributedString *attr = [[NSAttributedString alloc]initWithString:message attributes:@{NSParagraphStyleAttributeName:style}];
    self.messageLab.attributedText = attr;
    self.alertBgView.height = self.messageLab.bottom+Size(45+30+15);
}
-(void)setBtnArr:(NSArray *)btnArr{
    _btnArr = btnArr;
    CGFloat width = Size(601/2);
    if (_btnArr.count > 1) {
       
        for (int i=0; i<_btnArr.count; i++) {
            
            UIButton *btn = [UIButton ym_ButtonWithFrame:CGRectMake(width/2 - Size(218/2) - Size(21)/2 + Size(218/2+21)*i , self.alertBgView.height - Size(30+45), Size(218/2), Size(45)) title:btnArr[i] backgroundColor:HEXRGBCOLOR(0xf85839) titleColor:HEXRGBCOLOR(0xffffff) titleSize:Size(16)];
            btn.tag = i;
            btn.layer.cornerRadius = 4;
            [btn addTarget:self action:@selector(doBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.alertBgView addSubview:btn];
        }
    }else{
        UIButton *btn = [UIButton ym_ButtonWithFrame:CGRectMake(width/2-Size(276/4),self.alertBgView.height - Size(30+45),Size(276/2),Size(45)) title:_btnArr[0] backgroundColor:COLOR_MAIN_PERSON titleColor:HEXRGBCOLOR(0xffffff) titleSize:Size(16)];
        btn.layer.cornerRadius = 4;
        btn.tag = 0;
        btn.clipsToBounds = YES;
        [btn addTarget:self action:@selector(doBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.alertBgView addSubview:btn];
    }
}

-(void)show{
    [AppDelegateInstance.window addSubview:self];
}

-(void)doBtn:(UIButton *)btn{
    [self removeFromSuperview];
    BLOCK_EXEC(self.buttonClick,btn.tag);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
