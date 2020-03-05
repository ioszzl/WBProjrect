//
//  CJAlertView.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/16.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "CJAlertView.h"
@interface CJAlertView()
@property (nonatomic, strong) UIView *alertBgView;

@property (nonatomic, assign) NSTextAlignment messageAlignment;
@end
@implementation CJAlertView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBACOLOR(0, 0, 0, .5);
        [self initUI];
    }
    return self;
}
+(instancetype)CJAlertViewWithTitle:(NSString *)title message:(NSString *)message btnTitleArr:(NSArray *)btnTitleArr BtnBlock:(void(^)(NSInteger index))block{
    return [CJAlertView CJAlertViewWithTitle:title messageAlignment:NSTextAlignmentCenter message:message btnTitleArr:btnTitleArr BtnBlock:block];
}
+(instancetype)CJAlertViewWithTitle:(NSString *)title messageAlignment:(NSTextAlignment)alignment message:(NSString *)message btnTitleArr:(NSArray *)btnTitleArr BtnBlock:(void(^)(NSInteger index))block{
    CJAlertView *alert = [[CJAlertView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    alert.titleLabel.text = title;
    alert.messageAlignment = alignment;
    alert.message = message;
    alert.btnTitleArr = btnTitleArr;
    alert.buttonClick = block;
    
    return alert;
}
-(void)initUI{
    CGFloat width = Size(560/2);
    
    self.alertBgView = [[UIView alloc]initWithFrame:CGRectZero];
    self.alertBgView.backgroundColor = [UIColor whiteColor];
    self.alertBgView.layer.masksToBounds = YES;
    self.alertBgView.layer.cornerRadius = Size(5);
    [self addSubview:self.alertBgView];
    [self.alertBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(width);
        make.height.mas_greaterThanOrEqualTo(Size(360/2));
    }];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = HEXRGBCOLOR(0x666666);
    self.titleLabel.font = [UIFont systemFontOfSize:Size(18)];
    [self.alertBgView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.centerX.equalTo(self.alertBgView);
        make.height.mas_equalTo(Size(88/2));
    }];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectZero];
    line.backgroundColor = COLOR_RGB_line;
    [self.alertBgView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(88/2);
        make.height.mas_equalTo(0.6);
    }];
    
    self.messageLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(15)] textColor:HEXRGBCOLOR(0x333333) textAlignment:NSTextAlignmentLeft];
    [self.alertBgView addSubview:self.messageLab];
    [self.messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(12));
        make.right.mas_offset(-Size(12));
        make.top.equalTo(line.mas_bottom).mas_offset((Size(17)));
        make.bottom.mas_offset(-Size(108/2 + 17));
    }];
    
    
}

-(void)setMessage:(NSString *)message{
    _message = message;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.lineSpacing = Size(5);
    style.alignment = self.messageAlignment;
    NSAttributedString *attr = [[NSAttributedString alloc]initWithString:message attributes:@{NSParagraphStyleAttributeName:style}];
    self.messageLab.attributedText = attr;
    
    CGSize size = [self.messageLab sizeThatFits:CGSizeMake(Size(300-80), CGFLOAT_MAX)];
    //CGSize size = [message ym_calculateSize:[UIFont systemFontOfSize:Size(15)] maxWidth:Size(300-80) lineSpacing:Size(5)];
    self.messageLab.height = size.height;
    
   
    //self.alertBgView.height = self.messageLab.bottom+Size(45+30+15);
}
-(void)setBtnTitleArr:(NSArray *)btnTitleArr{
    _btnTitleArr = btnTitleArr;
    
    if (btnTitleArr.count == 1) {
        
        UIButton *btn = [UIButton ym_ButtonWithFrame:CGRectZero title:btnTitleArr[0] backgroundColor:COLOR_MAIN titleColor:HEXRGBCOLOR(0xffffff) titleSize:Size(16)];
        btn.tag = 0;
        btn.layer.cornerRadius = 4;
        [btn addTarget:self action:@selector(doBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.alertBgView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {

            make.centerX.equalTo(self.alertBgView);
            make.width.mas_equalTo(Size(80));
            make.height.mas_equalTo(Size(30));
            make.bottom.mas_offset(-Size(10));
        }];
        
    }else{
        UIView *line1 = [UIView new];
        line1.backgroundColor = COLOR_RGB_line;
        [self.alertBgView addSubview:line1];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_offset(0);
            make.bottom.mas_offset(-Size(108/2));
            make.height.mas_equalTo(0.5);
        }];
        
        UIView *line2 = [UIView new];
        line2.backgroundColor = COLOR_RGB_line;
        [self.alertBgView addSubview:line2];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.alertBgView);
            make.top.equalTo(line1.mas_bottom);
            make.bottom.mas_offset(0);
            make.width.mas_equalTo(0.5);
        }];
        
        
        for (int i=0; i<_btnTitleArr.count; i++) {
            
            UIButton *btn = [UIButton ym_ButtonWithFrame:CGRectZero title:btnTitleArr[i] backgroundColor:HEXRGBCOLOR(0xffffff) titleColor:HEXRGBCOLOR(0x333333) titleSize:Size(15)];
            btn.tag = i;
            btn.layer.cornerRadius = Size(5);
            [btn addTarget:self action:@selector(doBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.alertBgView addSubview:btn];
            if (i == 0) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.bottom.mas_offset(0);
                    make.right.equalTo(line2.mas_left);
                    make.top.equalTo(line1.mas_bottom);
                }];
                
            }else{
                [btn setTitleColor:COLOR_MAIN forState:UIControlStateNormal];
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.bottom.mas_offset(0);
                    make.left.equalTo(line2.mas_right);
                    make.top.equalTo(line1.mas_bottom);
                }];
            }
            
            
            [self.btnMuArr addObject:btn];
        }
    }
    
    
    
}

-(void)show{
    [AppDelegateInstance.window addSubview:self];
}

-(void)doBtn:(UIButton *)btn{
    [self removeFromSuperview];
    BLOCK_EXEC(self.buttonClick,btn.tag);
}
-(NSMutableArray<UIButton *> *)btnMuArr{
    if (!_btnMuArr) {
        _btnMuArr  = [NSMutableArray array];
    }
    return _btnMuArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
