//
//  SliderNewsTableViewCell.m
//  Test
//
//  Created by eims on 2018/11/1.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "SliderNewsTableViewCell.h"
#import "SGAdvertScrollView.h"
@interface SliderNewsTableViewCell()
@property (nonatomic, strong) SGAdvertScrollView * advertScrollView2;
@end

@implementation SliderNewsTableViewCell
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
        make.left.top.mas_offset(Size(10));
        make.right.bottom.mas_offset(-Size(10));
    }];
    NSString *imageName;
    if (AppDelegateInstance.userType == 1) {
        imageName = @"招聘头条1";
    } else {
        imageName = @"招聘头条";
    }
    UIImageView *titleImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    [bgV addSubview:titleImgV];
    [titleImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(Size(174/2));
        
        make.left.mas_offset(Size(12));
        make.top.mas_offset(Size(12));
    }];
    
    _advertScrollView2 = [[SGAdvertScrollView alloc]initWithFrame:CGRectZero];
    [bgV addSubview:_advertScrollView2];
    [_advertScrollView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleImgV.mas_right).mas_offset(Size(10));
        make.right.mas_offset(Size(-12));
        make.top.bottom.mas_offset(0);
    }];
    
    _advertScrollView2.advertScrollViewStyle = SGAdvertScrollViewStyleMore;
    _advertScrollView2.titleFont = FONT_SIZE_12;
    _advertScrollView2.topTitleColor = COLOR_RGB_153;
    _advertScrollView2.bottomTitleColor = COLOR_RGB_153;
}
-(void)setBottomTitleArr:(NSArray *)bottomTitleArr{
    _bottomTitleArr = bottomTitleArr;
    
    _advertScrollView2.bottomTitles = bottomTitleArr;
}
- (void)setBottomSignImageArr:(NSArray *)bottomSignImageArr{
    _bottomSignImageArr = bottomSignImageArr;
    
    _advertScrollView2.bottomSignImages = bottomSignImageArr;
}
-(void)setTopTitleArr:(NSArray *)topTitleArr{
    _topTitleArr = topTitleArr;
    _advertScrollView2.topTitles = topTitleArr;
    
}
-(void)setTopSignImageArr:(NSArray *)topSignImageArr{
    _topSignImageArr = topSignImageArr;
    _advertScrollView2.topSignImages = topSignImageArr;
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
