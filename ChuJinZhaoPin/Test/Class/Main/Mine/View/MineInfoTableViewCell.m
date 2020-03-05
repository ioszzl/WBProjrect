//
//  MineInfoTableViewCell.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/10.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "MineInfoTableViewCell.h"

@implementation MineInfoTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}
-(void)initUI{
    
    _titleLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:COLOR_RGB_51];
    _titleLab.numberOfLines = 1;
    [self.contentView addSubview:_titleLab];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.centerY.equalTo(self.contentView);
    }];
    [_titleLab addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    
    _arrowImgV  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"left_icon"]];
    [self.contentView addSubview:_arrowImgV];
    [_arrowImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(20));
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(Size(6));
        make.height.mas_equalTo(Size(12));
    }];
    
    _textF = [UITextField new];
    _textF.font = FONT_SIZE_15;
    _textF.textColor = COLOR_RGB_153;
    _textF.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_textF];
    [_textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arrowImgV.mas_left).mas_offset(Size(-15));
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(_titleLab.mas_right);
    }];
    
    UIView *line = [UIView new];
    self.line = line;
    line.backgroundColor = COLOR_RGB_line;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(10));
        make.right.mas_offset(-Size(10));
        make.height.mas_equalTo(0.5);
        make.bottom.equalTo(self.contentView);
    }];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"text"] && object == _titleLab) {
        [self.titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo([self.titleLab sizeThatFits:CGSizeMake(CGFLOAT_MAX, FONT_SIZE_15.lineHeight)].width);
        }];
    }
}
-(void)dealloc{
    [self.titleLab removeObserver:self forKeyPath:@"text"];
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
