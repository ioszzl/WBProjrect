//
//  FindIndexListTableViewCell.m
//  Test
//
//  Created by eims on 2018/11/1.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "FindIndexListTableViewCell.h"

@implementation FindIndexListTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}
-(void)initUI{
    _iconImgV = [UIImageView new];
    [self.contentView addSubview:_iconImgV];
    [_iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(Size(40));
    }];
    
    _titleLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:COLOR_RGB_51];
    [self.contentView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImgV.mas_right).mas_offset(Size(16));
        make.centerY.equalTo(_iconImgV);
    }];
    
    _arrowImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"left_icon"]];
    [self.contentView addSubview:_arrowImgV];
    [_arrowImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(Size(-21));
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(Size(7));
        make.height.mas_equalTo(Size(12));
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
