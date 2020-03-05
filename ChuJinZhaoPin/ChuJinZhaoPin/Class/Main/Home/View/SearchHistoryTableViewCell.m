//
//  SearchHistoryTableViewCell.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/2.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "SearchHistoryTableViewCell.h"

@implementation SearchHistoryTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}
-(void)initUI{
    
    _contentLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:RGBCOLOR(102, 102, 102)];
    _contentLab.adjustsFontSizeToFitWidth = YES;
    [self.contentView addSubview:_contentLab];
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(10));
        make.centerY.equalTo(self.contentView);
        make.right.mas_offset(-5);
    }];
    
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_deleteBtn setImage:[UIImage imageNamed:@"搜索页-删除"] forState:UIControlStateNormal];
    [self.contentView addSubview:_deleteBtn];
    [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(Size(-15));
        make.centerY.equalTo(self.contentView);
    }];
    [_deleteBtn addTarget:self action:@selector(doDeleteBtn) forControlEvents:UIControlEventTouchUpInside];
}

-(void)doDeleteBtn{
    BLOCK_EXEC(self.deleteBtnBlock);
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
