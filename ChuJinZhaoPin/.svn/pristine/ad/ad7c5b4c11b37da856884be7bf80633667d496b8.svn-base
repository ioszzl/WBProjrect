//
//  HotSearchTableViewCell.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/2.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "HotSearchTableViewCell.h"
#import "HotSearchItemCollectionViewCell.h"
@interface HotSearchTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectV;
@end
@implementation HotSearchTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}
-(void)initUI{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.contentView addSubview:_collectV];
    [_collectV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    _collectV.backgroundColor = COLOR_BG;
    _collectV.delegate = self;
    _collectV.dataSource = self;
    [_collectV registerClass:[HotSearchItemCollectionViewCell class] forCellWithReuseIdentifier:@"hotSearchItem"];
}

-(void)setDataSource:(NSArray<UserHotSaerchData *> *)dataSource{
    _dataSource = dataSource;
    [self.collectV reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HotSearchItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hotSearchItem" forIndexPath:indexPath];
    cell.contentLab.text = self.dataSource[indexPath.row].searchName;//@"产品经理";
    return cell;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return Size(30/2);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return (kScreenWidth-Size(20)-Size(200/2)*3)/2;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, Size(10), 0, Size(10));
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(Size(200/2), Size(62/2));
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HotSearchItemCollectionViewCell *cell = (HotSearchItemCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    BLOCK_EXEC(self.itemDidSelectedBlock,cell.contentLab.text,indexPath.row);
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
