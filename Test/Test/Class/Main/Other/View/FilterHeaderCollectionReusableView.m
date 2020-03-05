//
//  FilterHeaderCollectionReusableView.m
//  Test
//
//  Created by eims on 2018/11/15.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "FilterHeaderCollectionReusableView.h"

@implementation FilterHeaderCollectionReusableView
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
    _titleLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(13)] textColor:COLOR_RGB_51];
    [self addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.centerY.equalTo(self);
    }];
}
@end
