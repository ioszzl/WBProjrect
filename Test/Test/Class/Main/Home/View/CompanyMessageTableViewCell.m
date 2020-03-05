//
//  CompanyMessageTableViewCell.m
//  Test
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "CompanyMessageTableViewCell.h"

@implementation CompanyMessageTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}
-(void)initUI{
    
    self.backgroundColor = COLOR_BG;
    
    UIView *bgV = [UIView new];
    bgV.backgroundColor = RGBCOLOR(255, 255, 255);
    [self.contentView addSubview:bgV];
    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
    }];
    
    UIImageView *manageImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"工作年限"]];
    manageImgV.contentMode = UIViewContentModeScaleAspectFit;
    [bgV addSubview:manageImgV];
    [manageImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.top.mas_offset(Size(5));
        make.width.mas_equalTo(Size(28/2));
        make.height.mas_equalTo(Size(28/2));
    }];
    
    _manageLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:COLOR_RGB_51];
    [bgV addSubview:_manageLab];
    [_manageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(manageImgV.mas_right).mas_offset(Size(11));
        make.centerY.equalTo(manageImgV);
    }];
    _manageLab.text = @"私营";
    
    UIImageView *peopleImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"学历"]];
    peopleImgV.contentMode = UIViewContentModeScaleAspectFit;
    [bgV addSubview:peopleImgV];
    [peopleImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_manageLab.mas_right).mas_offset(Size(15));
        make.centerY.equalTo(_manageLab);
        make.width.mas_equalTo(Size(28/2));
        make.height.mas_equalTo(Size(28/2));
    }];
    
    _peopleLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:COLOR_RGB_51];
    [bgV addSubview:_peopleLab];
    [_peopleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(peopleImgV.mas_right).mas_offset(Size(11));
        make.centerY.equalTo(peopleImgV);
    }];
    _peopleLab.text = @"2000人";
    
    UIImageView *tradeImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"行业"]];
    tradeImgV.contentMode = UIViewContentModeScaleAspectFit;
    [bgV addSubview:tradeImgV];
    [tradeImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_peopleLab.mas_right).mas_offset(Size(15));
        make.centerY.equalTo(_peopleLab);
        make.width.mas_equalTo(Size(28/2));
        make.height.mas_equalTo(Size(28/2));
    }];
    
    _tradeLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:COLOR_RGB_51];
    _tradeLab.numberOfLines = 1;
    [bgV addSubview:_tradeLab];
    [_tradeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tradeImgV.mas_right).mas_offset(Size(11));
        make.centerY.equalTo(tradeImgV);
        make.right.mas_lessThanOrEqualTo(-Size(15));
    }];
    _tradeLab.text = @"移动互联网";
    
    UIImageView *positIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"职位详情-定位"]];
    [bgV addSubview:positIcon];
    [positIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(30/2));
        make.top.equalTo(manageImgV.mas_bottom).mas_offset(Size(20));
        make.width.mas_equalTo(Size(12));
        make.height.mas_equalTo(Size(16));
    }];
    
    _addressLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_12 textColor:COLOR_RGB_102];
    [bgV addSubview:_addressLab];
    [_addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(positIcon.mas_right).mas_offset(Size(5));
        make.top.equalTo(positIcon);
        make.right.mas_offset(Size(-15));
        make.bottom.mas_offset(-16);
    }];
    _addressLab.numberOfLines = 0;
    
    
    
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
