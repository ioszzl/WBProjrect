//
//  HotSearchItemCollectionViewCell.m
//  Test
//
//  Created by eims on 2018/11/2.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "HotSearchItemCollectionViewCell.h"

@implementation HotSearchItemCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    self.contentLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:RGBCOLOR(102, 102, 102) textAlignment:NSTextAlignmentCenter];
    self.contentLab.backgroundColor = RGBCOLOR(255, 255, 255);
    [self.contentView addSubview:self.contentLab];
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}
@end
