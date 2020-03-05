//
//  HomeJobListTableViewCell.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/1.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "HomeJobListTableViewCell.h"
@interface HomeJobListTableViewCell(){
    UIView *_bgV;
}
@end
@implementation HomeJobListTableViewCell
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
    _bgV = bgV;
    bgV.backgroundColor = RGBCOLOR(255, 255, 255);
    [self.contentView addSubview:bgV];
    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_offset(0);
        make.height.mas_equalTo(Size(262/2));
    }];
    
    _jobNameLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(16)] textColor:COLOR_RGB_51];
    [bgV addSubview:_jobNameLab];
    [_jobNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(14));
        make.top.mas_offset(Size(20));
        make.width.mas_lessThanOrEqualTo(Size(500/2));
    }];
//    _jobNameLab.text = @"产品经理";
    
    _moneyLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:RGBCOLOR(255, 101, 64)];
    [bgV addSubview:_moneyLab];
    [_moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(15));
        make.top.mas_offset(Size(40));
        make.width.mas_lessThanOrEqualTo(Size(190/2));
    }];
//    _moneyLab.text = @"7~9K";
    
    _dateLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(11)] textColor:RGBCOLOR(102, 102, 102)];
    [bgV addSubview:_dateLab];
    [_dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(15));
        make.top.equalTo(_moneyLab.mas_bottom).mas_offset(Size(15));
    }];
//    _dateLab.text = @"7月27日";
    
    _logoImgV = [UIImageView new];
    _logoImgV.contentMode = UIViewContentModeScaleAspectFit;
    [bgV addSubview:_logoImgV];
    [_logoImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.width.mas_equalTo(Size(74/2));
        make.height.mas_equalTo(Size(60/2));
        make.bottom.mas_offset(-Size(16));
    }];
//    _logoImgV.image = [UIImage imageNamed:@"附近职位logo"];
    
    _companyLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:COLOR_RGB_51];
    [bgV addSubview:_companyLab];
    [_companyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_logoImgV.mas_right).mas_offset(Size(10));
        make.top.equalTo(_logoImgV.mas_top);
        make.width.mas_lessThanOrEqualTo(Size(420/2));
    }];
//    _companyLab.text = @"shopee";
    
    UIImageView *tempImgV;
    for (int i = 0; i<5; i++) {
        UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"职位详情-收藏01"]];
        [bgV addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!tempImgV) {
                make.left.equalTo(_logoImgV.mas_right).mas_offset(Size(10));
                make.bottom.equalTo(_logoImgV.mas_bottom);
            }else{
                make.left.equalTo(tempImgV.mas_right).mas_offset(Size(5));
                make.top.equalTo(tempImgV);
            }
            make.width.height.mas_equalTo(Size(23/2));
            
        }];
        tempImgV = imgV;
        [self.starImgVArr addObject:imgV];
    }
    
   
    
    _scoreLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(11)] textColor:COLOR_RGB_51];
    [bgV addSubview:_scoreLab];
    [_scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.starImgVArr.lastObject.mas_right).mas_offset(Size(8));
        make.centerY.equalTo(self.starImgVArr.lastObject);
    }];
//    _scoreLab.text = @"4.5分";
    
    _meterLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_12 textColor:COLOR_RGB_51 textAlignment:NSTextAlignmentRight];
    _meterLab.hidden = YES;
    [bgV addSubview:_meterLab];
    [_meterLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(15));
        make.bottom.equalTo(_companyLab);
        make.width.mas_lessThanOrEqualTo(170/2);
    }];
    
    _addressBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"" backgroundColor:nil titleColor:COLOR_RGB_51 titleSize:Size(11)];
    _addressBtn.hidden = YES;
    _addressBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [bgV addSubview:_addressBtn];
    [_addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(15));
        make.top.equalTo(_meterLab.mas_bottom);
        make.width.mas_lessThanOrEqualTo(Size(350/2));
        make.height.mas_equalTo(Size(54/2));
    }];
    [_addressBtn setImage:[UIImage imageNamed:@"职位详情-定位"] forState:UIControlStateNormal];
    [_addressBtn addTarget:self action:@selector(doAddressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *arr = @[@"",@"",@""];
    UILabel *tempLab;
    for (int i=0; i<arr.count; i++) {
        UILabel *lab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(12)] textColor:COLOR_RGB_153];
        lab.backgroundColor = RGBCOLOR(249, 250, 253);
        lab.layer.cornerRadius = Size(5);
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = arr[i];
        [_bgV addSubview:lab];
//        CGFloat w = [arr[i] ym_getStringWidthfont:[UIFont systemFontOfSize:Size(10)]];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!tempLab) {
                make.left.mas_offset(Size(14));
                make.top.equalTo(_jobNameLab.mas_bottom).mas_offset(Size(12));
            }else{
                make.left.equalTo(tempLab.mas_right).mas_offset(Size(7));
                make.top.equalTo(tempLab);
            }
            make.height.mas_equalTo(Size(35/2));
            //make.width.mas_equalTo(w+Size(10));
        }];
        
        tempLab = lab;
        [self.tagLabArr addObject:lab];
    }
}
-(void)setModel:(HomeIndexList *)model{
    _model = model;
    
    _jobNameLab.text = model.job_name;//@"产品经理";
    _moneyLab.text = model.show_range;//@"7~9K";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.push_time.integerValue];
    
    _dateLab.text = [date stringWithFormat:@"MM月DD日"];//@"7月27日";
    [_logoImgV sd_setImageWithURL:[NSURL URLWithString:model.companyLogo] placeholderImage:[UIImage imageNamed:@"前台默认站位图.png"]];  //[UIImage imageNamed:@"附近职位logo"];
    _companyLab.text = model.company_name;//@"shopee";
    
    self.score = model.total_star;
    
    //
    [self.addressBtn setTitle:model.company_address forState:UIControlStateNormal];
    [self.addressBtn ym_layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:Size(5)];
    if (model.distance*1000 < 1000) {
        self.meterLab.text = [NSString stringWithFormat:@"%.0fm",model.distance*1000];
    }else{
        self.meterLab.text = [NSString stringWithFormat:@"%.2fkm",model.distance];
    }
    
    
    self.tagLabArr[0].text = model.work_address;
    [self.tagLabArr[0] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([self.tagLabArr[0].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10));
    }];
    self.tagLabArr[1].text = [AppDelegateInstance educationNameWithID:model.education_level];
    [self.tagLabArr[1] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([self.tagLabArr[1].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10));
    }];
    self.tagLabArr[2].text = [AppDelegateInstance userWorkYearNameWithID:model.work_year]; //model.work_class;
    [self.tagLabArr[2] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([self.tagLabArr[2].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10)).priorityHigh();
        make.right.mas_lessThanOrEqualTo(-Size(135/2));
    }];
    
    
}
-(void)setList:(RecruitJobList *)list{
    _list = list;
    
    _jobNameLab.text = list.job_name;//@"产品经理";
    _moneyLab.text = list.show_range;//@"7~9K";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:list.push_time.integerValue];
    
    _dateLab.text = [date stringWithFormat:@"MM月DD日"];//@"7月27日";
    
    
    self.tagLabArr[0].text = list.work_region;
    [self.tagLabArr[0] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([self.tagLabArr[0].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10));
    }];
    self.tagLabArr[1].text = list.education_level_str;
    [self.tagLabArr[1] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([self.tagLabArr[1].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10));
    }];
    self.tagLabArr[2].text = list.describ;
    [self.tagLabArr[2] mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([self.tagLabArr[2].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10)).priorityHigh();
        make.right.mas_lessThanOrEqualTo(-Size(135/2));
    }];
}

- (void)setScore:(NSString *)score{
    _score = score;
    
    CGFloat s = score.floatValue;
    for (int i = 0; i<5; i++) {
        if (i<floorf(s)) {
            self.starImgVArr[i].image = [UIImage imageNamed:@"职位详情-收藏02"];
        }else{
            self.starImgVArr[i].image = [UIImage imageNamed:@"职位详情-收藏01"];
        }
    }
    if (s - floorf(s) == 0) {
        
    }else{
        [self.starImgVArr objectAtIndex:(NSUInteger )(ceilf(s)-1)].image = [UIImage imageNamed:@"半颗心"];
    }
    _scoreLab.text = score;//@"4.5分";
}


-(void)doAddressBtn:(UIButton *)btn{
    BLOCK_EXEC(self.addressBtnBlock,btn);
}

-(NSMutableArray<UIImageView *> *)starImgVArr{
    if (!_starImgVArr) {
        _starImgVArr = [NSMutableArray array];
    }
    return _starImgVArr;
}
-(NSMutableArray<UILabel *> *)tagLabArr{
    if (!_tagLabArr) {
        _tagLabArr = [NSMutableArray array];
    }
    return _tagLabArr;
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
