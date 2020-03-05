//
//  CompanyEnvironmentTableViewCell.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "CompanyEnvironmentTableViewCell.h"
#import "TYCyclePagerView.h"
#import "TYCyclePagerViewCell.h"
#import "XLPhotoBrowser.h"
@interface CompanyEnvironmentTableViewCell()<TYCyclePagerViewDelegate,TYCyclePagerViewDataSource,XLPhotoBrowserDatasource>
@property (nonatomic, strong) TYCyclePagerView *pagerView;
@end
@implementation CompanyEnvironmentTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}
-(void)setImgArr:(NSArray *)imgArr{
    _imgArr = imgArr;
    [self.pagerView reloadData];
}
-(void)initUI{
    self.backgroundColor = COLOR_BG;
    
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, Size(435/2+20))];
    bgV.backgroundColor = RGBCOLOR(255, 255, 255);
    [self.contentView addSubview:bgV];
//    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.mas_offset(0);
//        make.bottom.mas_offset(Size(-5));
//    }];
    
    
    TYCyclePagerView * pagerView = [[TYCyclePagerView alloc]init];
    pagerView.frame = CGRectMake(Size(15), 0, kScreenWidth-Size(30),Size(435/2));
    pagerView.layer.cornerRadius = Size(5);
    pagerView.clipsToBounds = YES;
    [bgV addSubview:pagerView];
    
    self.pagerView = pagerView;
//    pagerView.isInfiniteLoop = YES;
//    pagerView.autoScrollInterval = 3;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    [pagerView registerClass:[TYCyclePagerViewCell class] forCellWithReuseIdentifier:@"TYCyclePagerViewCell"];
}

#pragma mark - pageView delegate
-(NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView{
    return self.imgArr.count;
}

-(UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index{
    TYCyclePagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"TYCyclePagerViewCell" forIndex:index];
    
    [cell.contentImage sd_setImageWithURL:[NSURL URLWithString:self.imgArr[index]] placeholderImage:[UIImage imageNamed:@"banner空页面"]];
    //cell.contentImage.image = [UIImage imageNamed:@"1.jpg"];
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView{
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    
    //layout.itemSpacing = 5;
    layout.itemSize = CGSizeMake(kScreenWidth, Size(435/2));
    layout.layoutType = TYCyclePagerTransformLayoutNormal;
    //layout.minimumAlpha = 0.3;
    layout.itemHorizontalCenter = YES;
    layout.itemVerticalCenter= NO;
    layout.adjustSpacingWhenScroling = NO;
    
    return layout;
}
- (void)pagerView:(TYCyclePagerView *)pageView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index{
    XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithImages:self.imgArr currentImageIndex:index];
    browser.sourceImageView = ((TYCyclePagerViewCell *)cell).contentImage;
    browser.datasource = self;
    browser.browserStyle = XLPhotoBrowserStyleIndexLabel; // 微博样式
}

- (UIImageView *)photoBrowser:(XLPhotoBrowser *)browser sourceImageViewForIndex:(NSInteger)index {
    return browser.sourceImageView;
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
