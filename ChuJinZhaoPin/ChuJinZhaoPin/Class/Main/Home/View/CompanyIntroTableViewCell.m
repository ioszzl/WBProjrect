//
//  CompanyIntroTableViewCell.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "CompanyIntroTableViewCell.h"

@implementation CompanyIntroTableViewCell
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
        make.bottom.mas_offset(-Size(5));
    }];
    
    _contentLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(13)] textColor:COLOR_RGB_51];
    [bgV addSubview:_contentLab];
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.right.mas_offset(Size(-15));
        make.top.mas_offset(0);
    }];
    _contentLab.text = @"好未来";
    
    UILabel *websitLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:COLOR_RGB_51];
    [bgV addSubview:websitLab];
    [websitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.top.equalTo(_contentLab.mas_bottom).mas_offset(30);
    }];
    websitLab.text = @"公司官网";
    _websitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_websitBtn setTitleColor:COLOR_MAIN forState:UIControlStateNormal];
    [bgV addSubview:_websitBtn];
    _websitBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [_websitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(websitLab);
        make.left.equalTo(websitLab.mas_right).mas_offset(Size(15));
        make.right.mas_lessThanOrEqualTo(-Size(10));
    }];
    [_websitBtn addTarget:self action:@selector(doWebsitBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *queryBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"查询工商信息" backgroundColor:nil titleColor:COLOR_MAIN titleSize:Size(15)];
    queryBtn.layer.cornerRadius = Size(4);
    [bgV addSubview:queryBtn];
    [queryBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(websitLab.mas_bottom).mas_offset(Size(35));
        make.left.mas_offset(15);
        make.bottom.mas_offset(-Size(20));
        make.height.mas_equalTo(Size(68/2));
        make.width.mas_equalTo(Size(150));
    }];
    queryBtn.layer.borderColor = COLOR_MAIN.CGColor;
    queryBtn.layer.borderWidth = 0.5;
    [queryBtn addTarget:self action:@selector(doQueryBtn) forControlEvents:UIControlEventTouchUpInside];
}
-(void)doQueryBtn{
    BLOCK_EXEC(self.queryBtnBlock);
}
-(void)doWebsitBtn:(UIButton *)btn{
    BLOCK_EXEC(self.websitBtnBlock,btn);
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
