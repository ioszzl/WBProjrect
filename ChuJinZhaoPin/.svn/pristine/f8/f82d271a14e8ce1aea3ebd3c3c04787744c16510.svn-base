//
//  FilterCollectionViewCell.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/15.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "FilterCollectionViewCell.h"

@implementation FilterCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    self.backgroundColor = RGBCOLOR(255, 255, 255);
    
    _btn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"" backgroundColor:COLOR_BG titleColor:COLOR_RGB_51 titleSize:Size(17)];
    _btn.layer.cornerRadius = Size(4);
    _btn.clipsToBounds = YES;
    [_btn setTitleColor:COLOR_MAIN forState:UIControlStateSelected];
    [self.contentView addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    _btn.userInteractionEnabled = NO;
}

-(void)setText:(NSString *)text{
    _text = text;
    [_btn setTitle:text forState:UIControlStateNormal];
}
-(void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    
    if (isSelected) {
        _btn.selected = YES;
        _btn.layer.borderColor = COLOR_MAIN.CGColor;
        _btn.layer.borderWidth = 0.5;
    }else{
        _btn.selected = NO;
        _btn.layer.borderWidth = 0;
    }
}
@end
