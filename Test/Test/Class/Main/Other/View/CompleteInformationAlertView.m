//
//  CompleteInformationAlertView.m
//  Test
//
//  Created by eims on 2018/10/31.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "CompleteInformationAlertView.h"

@implementation CompleteInformationAlertView
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
        make.width.mas_equalTo(Size(560/2));
        make.height.mas_equalTo(Size(314/2));
    }];
    
    UIButton *skipBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"跳过" backgroundColor:nil titleColor:COLOR_MAIN titleSize:Size(15)];
    [alertV addSubview:skipBtn];
    [skipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(54/2));
        make.top.mas_offset(Size(7));
    }];
    [skipBtn addTarget:self action:@selector(doSkipBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *line = [UIView new];
    line.backgroundColor = RGBCOLOR(230, 230, 230);
    [alertV addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.right.mas_offset(0);
        make.top.mas_offset(Size(88/2));
    }];
    
    UITextView *contentTextV = [UITextView new];
    self.contentTextV = contentTextV;
    contentTextV.editable = NO;
    contentTextV.scrollEnabled = NO;
    contentTextV.delegate = self;
    contentTextV.backgroundColor = HEXRGBCOLOR(0xffffff);
    contentTextV.font = [UIFont systemFontOfSize:Size(15)];
    
    [alertV addSubview:contentTextV];
    [contentTextV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(54/2));
        make.right.mas_offset(-Size(54/2));
        make.bottom.mas_offset(-Size(96/2));
    }];
    //[UILabel ym_labelWithFrame:CGRectMake(Size(15), logoImgV.bottom+Size(20), kScreenWidth-Size(30), Size(67.5)) font:[UIFont systemFontOfSize:Size(15)] textColor:TEXT_LIGHTBLACK_COLOR];
    //contentLab.numberOfLines = 0;
    
}
-(void)setAllStr:(NSString *)allStr{
    _allStr = allStr;
    _attrStr = [[NSMutableAttributedString alloc]initWithString:self.allStr];
    [_attrStr setAttributes:@{NSForegroundColorAttributeName:COLOR_RGB_51,NSFontAttributeName:FONT_SIZE_15} range:NSMakeRange(0, _attrStr.length)];
    self.contentTextV.attributedText = _attrStr;
}
-(void)setHrefStr:(NSString *)hrefStr{
    _hrefStr = hrefStr;
    if (_attrStr) {
        [_attrStr setAttributes:@{NSForegroundColorAttributeName:COLOR_MAIN,NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]} range:[[_attrStr string] rangeOfString:self.hrefStr]];
        [_attrStr addAttribute:NSLinkAttributeName value:@"href://" range:[[_attrStr string] rangeOfString:self.hrefStr]];
        self.contentTextV.linkTextAttributes = @{NSForegroundColorAttributeName:COLOR_MAIN};
        
        self.contentTextV.attributedText = _attrStr;
    }
    
}

-(void)doSkipBtn{
    self.hidden = YES;
    BLOCK_EXEC(self.skipBtnBlock);
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    //    NSLog(@"----%@",URL);
    if ([[URL scheme] isEqualToString:@"href"]) {
        
        BLOCK_EXEC(self.completeInfoBlock);
        return NO;
    }
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
