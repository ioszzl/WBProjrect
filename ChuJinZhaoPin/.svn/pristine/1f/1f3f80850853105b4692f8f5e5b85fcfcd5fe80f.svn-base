//
//  CJChoseAlertView.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/16.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "CJChoseAlertView.h"
@interface CJChoseAlertView()
@property (nonatomic, strong) UIView *alertBgView;
@property (nonatomic, strong) NSMutableArray<UIButton *> *choseBtnArr;

@property (nonatomic, strong) UIButton *choseedBtn;
@end
@implementation CJChoseAlertView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBACOLOR(0, 0, 0, .5);
        [self initUI];
    }
    return self;
}
+(instancetype)CJChoseAlertViewWithTitle:(NSString *)title ChoseBtnTitleArr:(NSArray *)choseBtnTitleArr btnTitleArr:(NSArray *)btnTitleArr BtnBlock:(void(^)(NSInteger index, NSInteger choseIndex))block{
    CJChoseAlertView *alert = [[CJChoseAlertView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    alert.titleLabel.text = title;
    alert.choseBtnTitleArr = choseBtnTitleArr;
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
    
    
    
}

- (void)setChoseBtnTitleArr:(NSArray *)choseBtnTitleArr{
    _choseBtnTitleArr = choseBtnTitleArr;
    
    UIButton *tempBtn;
    for (int i=0; i<choseBtnTitleArr.count; i++) {
        UIButton *btn1 = [UIButton ym_ButtonWithFrame:CGRectZero title:choseBtnTitleArr[i] backgroundColor:nil titleColor:COLOR_RGB_51 titleSize:Size(15)];
        [btn1 setImage:[UIImage imageNamed:@"no"] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:@"yes"] forState:UIControlStateSelected];
        if (i==0) {
            btn1.selected = YES;
        }
        
        btn1.tag = 100+i;
        [self.alertBgView addSubview:btn1];
        [btn1 addTarget:self action:@selector(doChoseBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.choseBtnArr addObject:btn1];
        if (i%2 == 0) {
            [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
                if (!tempBtn) {
                    make.top.mas_offset(88/2+20);
                }else{
                    make.top.equalTo(tempBtn.mas_bottom);
                }
                make.left.mas_offset(0);
                make.right.equalTo(self.alertBgView.mas_centerX);
                make.height.mas_equalTo(Size(40));
            }];
            
            tempBtn = btn1;
        }else{
            [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(tempBtn);
                make.right.mas_offset(0);
                make.left.equalTo(self.alertBgView.mas_centerX);
                make.height.mas_equalTo(Size(40));
            }];
        }
        [tempBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_offset(-Size(108/2+20));
        }];
        
        [btn1 ym_layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:Size(5)];
        
        
    }
  
    
}


-(void)setBtnTitleArr:(NSArray *)btnTitleArr{
    _btnTitleArr = btnTitleArr;
    
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

-(void)show{
    [AppDelegateInstance.window addSubview:self];
}

-(void)doBtn:(UIButton *)btn{
    [self removeFromSuperview];
    BLOCK_EXEC(self.buttonClick,btn.tag,self.choseedBtn.tag - 100);
}
-(void)doChoseBtn:(UIButton *)btn{
    for (UIButton *btt in self.choseBtnArr) {
        btt.selected = NO;
    }
    btn.selected = YES;
    self.choseedBtn = btn;
}
-(NSMutableArray<UIButton *> *)btnMuArr{
    if (!_btnMuArr) {
        _btnMuArr  = [NSMutableArray array];
    }
    return _btnMuArr;
}
-(NSMutableArray<UIButton *> *)choseBtnArr{
    if (!_choseBtnArr) {
        _choseBtnArr = [NSMutableArray array];
    }
    return _choseBtnArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
