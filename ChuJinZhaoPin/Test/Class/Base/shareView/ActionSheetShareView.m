//
//  ActionSheetShareView.m
//  MaShangYin
//
//  Created by eims on 2018/6/4.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import "ActionSheetShareView.h"

#define SheetHeight 308/2
@interface ActionSheetShareView()
@property (nonatomic, strong) UIView *bgview;
@end
@implementation ActionSheetShareView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
        [self initUI];
    }
    return self;
}
-(void)initUI{
    _bgview = [[UIView alloc]initWithFrame:CGRectMake(0, self.height, kScreenWidth, SheetHeight)];
    _bgview.backgroundColor = HEXRGBCOLOR(0xeeeeee);
    [self addSubview:_bgview];
    
    NSArray *arr = @[@"微信",@"新浪",@"QQ"];
    NSArray *imgArr = @[@"微信",@"微博",@"QQ"];
    for (int i=0; i<arr.count; i++) {
        //CGRectMake(Size(97/2)+Size(135/2+41)*i, Size(53), Size(41), Size(65))
        UIButton *Btn = [UIButton ym_ButtonWithFrame:CGRectMake(kScreenWidth/3*i, 0, kScreenWidth/3, Size(214/2)) title:arr[i] backgroundColor:HEXRGBCOLOR(0xffffff) titleColor:HEXRGBCOLOR(0x666666) titleSize:Size(12)];
        [Btn setImage:[UIImage imageNamed:imgArr[i]] forState:UIControlStateNormal];
        [Btn ym_layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:Size(10)];
        [Btn addTarget:self action:@selector(doShareBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_bgview addSubview:Btn];
    }
    
    UIButton *cancelBtn = [UIButton ym_ButtonWithFrame:CGRectMake(0, _bgview.height-Size(92/2), _bgview.width, Size(92/2)) title:@"取消" backgroundColor:HEXRGBCOLOR(0xffffff) titleColor:HEXRGBCOLOR(0x666666) titleSize:Size(15)];
    [cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [_bgview addSubview:cancelBtn];
}
//分享按钮点击
-(void)doShareBtn:(UIButton *)btn{
    //NSLog(@"share...%@",btn.titleLabel.text);
    BLOCK_EXEC(self.shareBtnBlock, btn.titleLabel.text);
}
//弹出分享按钮
-(void)show{
    [AppDelegateInstance.window  addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.bgview.top = self.height-SheetHeight;
    }];
}
//隐藏分享按钮
-(void)cancel{
    [UIView animateWithDuration:0.3 animations:^{
        self.bgview.top = self.height;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if (point.y < (self.height-SheetHeight)) {
        [self cancel];
    }
    return;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
