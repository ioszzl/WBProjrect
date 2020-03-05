//
//  EducationFilterView.m
//  Test
//
//  Created by eims on 2018/11/15.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "EducationFilterView.h"
#import "FilterCollectionViewCell.h"
#import "FilterHeaderCollectionReusableView.h"
#import "RHNetAPIManager.h"
#import "RHNetAPIManager+Request.h"
#import "FilterModel.h"
@interface EducationFilterView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectV;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) FilterModel *model;

@property (nonatomic, strong) NSMutableArray *eduArr;
@property (nonatomic, strong) NSMutableArray *salaArr;
@property (nonatomic, strong) NSMutableArray *workArr;
@end
@implementation EducationFilterView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = RGBACOLOR(0, 0, 0, .5);
        [self requestData];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBACOLOR(0, 0, 0, .5);
        [self requestData];
        
    }
    return self;
}
-(void)initUI{
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectV.delegate = self;
    _collectV.dataSource = self;
    _collectV.showsVerticalScrollIndicator = NO;
    _collectV.showsHorizontalScrollIndicator = NO;
    [self addSubview:_collectV];
    _collectV.backgroundColor = [UIColor whiteColor];
    [_collectV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_collectV registerClass:[FilterCollectionViewCell class] forCellWithReuseIdentifier:@"FilterCollectionViewCell"];
    [_collectV registerClass:[FilterHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FilterHeader"];
    [_collectV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
    
    
}
-(void)setDefautArr:(NSArray *)defautArr{
    _defautArr = defautArr;
    self.workArr = defautArr[1];
    self.eduArr = defautArr[0];
    self.salaArr = defautArr[2];
    
    [self.collectV reloadData];
}

-(void)setItemArr:(NSArray<NSIndexPath *> *)itemArr{
    _itemArr = itemArr;
    [self.collectV reloadData];
}
-(void)requestData{
   
    
    [[RHNetAPIManager sharedManager]appSearchCriteriaOPT].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
        if (data) {
            self.model = [FilterModel mj_objectWithKeyValues:data];
            
            Scale *scal = [Scale new];
            scal.ID = -1;
            scal.value = @"全部";
            
            NSMutableArray *temp = [NSMutableArray arrayWithArray:self.model.data.eduLevel];
            [temp insertObject:scal atIndex:0];
            self.model.data.eduLevel = temp;
            
            NSMutableArray *temp1 = [NSMutableArray arrayWithArray:self.model.data.companyWorkYear];
            [temp1 insertObject:scal atIndex:0];
            self.model.data.companyWorkYear = temp1;
            
            NSMutableArray *temp2 = [NSMutableArray arrayWithArray:self.model.data.userWorkYear];
            [temp2 insertObject:scal atIndex:0];
            self.model.data.userWorkYear = temp2;
            
            NSMutableArray *temp3 = [NSMutableArray arrayWithArray:self.model.data.salary];
            [temp3 insertObject:scal atIndex:0];
            self.model.data.salary = temp3;
            
            self.workArr = [NSMutableArray arrayWithObjects:scal, nil];
            self.eduArr = [NSMutableArray arrayWithObjects:scal, nil];
            self.salaArr = [NSMutableArray arrayWithObjects:scal, nil];
            

            [self initUI];
//            [self.collectV reloadData];
//            [self layoutSubviews];
        }
    });
}
#pragma mark - action
-(void)doResetBtn{
    
    [self.workArr removeAllObjects];
    [self.eduArr removeAllObjects];
    [self.salaArr removeAllObjects];
    
    if (AppDelegateInstance.userType == 1) {
        [self.workArr addObject:self.model.data.companyWorkYear.firstObject];
    }else{
        [self.workArr addObject:self.model.data.userWorkYear.firstObject];
    }
    [self.eduArr addObject:self.model.data.eduLevel.firstObject];
    [self.salaArr addObject:self.model.data.salary.firstObject];
    
    [self.collectV reloadData];
}
-(void)doSureBtn{
    Scale * edu = self.eduArr[0];
    Scale * work = self.workArr[0];
    Scale * sala = self.salaArr[0];
    BLOCK_EXEC(self.sureBtnBlock, edu.value, work.value, sala.value, edu.ID, work.ID, sala.ID);
}
#pragma mark - collectview delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    switch (section) {
        case 0://学历
            return self.model.data.eduLevel.count;
            break;
        case 1:{//工作经验
            if (AppDelegateInstance.userType == 1) {//企业
                return self.model.data.companyWorkYear.count;
            }else{
                return self.model.data.userWorkYear.count;
            }
        }
            break;
        case 2://薪资
            return self.model.data.salary.count;
            break;
        default:
            break;
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FilterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilterCollectionViewCell" forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:{//学历
            cell.text = self.model.data.eduLevel[indexPath.row].value;
            if ([self.eduArr containsObject:self.model.data.eduLevel[indexPath.row]]) {
                cell.isSelected = YES;
            }else{
                cell.isSelected = NO;
            }
        }
            break;
        case 1:{//工作经验
            if (AppDelegateInstance.userType == 1) {
                cell.text = self.model.data.companyWorkYear[indexPath.row].value;
                if ([self.workArr containsObject:self.model.data.companyWorkYear[indexPath.row]]) {
                    cell.isSelected = YES;
                }else{
                    cell.isSelected = NO;
                }
            }else{
                cell.text = self.model.data.userWorkYear[indexPath.row].value;
                if ([self.workArr containsObject:self.model.data.userWorkYear[indexPath.row]]) {
                    cell.isSelected = YES;
                }else{
                    cell.isSelected = NO;
                }
            }
        }
            break;
        case 2:{//薪资
            cell.text = self.model.data.salary[indexPath.row].value;
            if ([self.salaArr containsObject:self.model.data.salary[indexPath.row]]) {
                cell.isSelected = YES;
            }else{
                cell.isSelected = NO;
            }
        }
            break;
        default:
            break;
    }
    
    
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(Size(188/2), Size(64/2));
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(Size(10), Size(15), Size(10), Size(15));
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return Size(15);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return (kScreenWidth-(Size(30)+Size(188/2)*3) -1) / 2;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //FilterCollectionViewCell *cell = (FilterCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:{//学历
            [self.eduArr removeAllObjects];
            [self.eduArr addObject:self.model.data.eduLevel[indexPath.row]];
        }
            break;
        case 1:{//经验
            [self.workArr removeAllObjects];
            if (AppDelegateInstance.userType == 1) {
                [self.workArr addObject:self.model.data.companyWorkYear[indexPath.row]];
            }else{
                [self.workArr addObject:self.model.data.userWorkYear[indexPath.row]];
            }
        }
            break;
        case 2:{//薪资
            [self.salaArr removeAllObjects];
            [self.salaArr addObject:self.model.data.salary[indexPath.row]];
        }
            break;
        default:
            break;
    }
    [self.collectV reloadData];
    BLOCK_EXEC(self.selectedItemBlock,indexPath);
    //cell.isSelected = !cell.isSelected;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionFooter) {
        if (indexPath.section == 2) {
            UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView" forIndexPath:indexPath];
            view.backgroundColor = RGBCOLOR(255, 255, 255);
            
            UIButton *resetBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"重置" backgroundColor:COLOR_BG titleColor:COLOR_RGB_102 titleSize:Size(15)];
            [view addSubview:resetBtn];
            resetBtn.layer.cornerRadius = Size(5);
            [resetBtn addTarget:self action:@selector(doResetBtn) forControlEvents:UIControlEventTouchUpInside];
            [resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.mas_offset(Size(15));
                make.width.mas_equalTo(Size(316/2));
                make.height.mas_equalTo(Size(40));
            }];
            
            UIButton *sureBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"确定" backgroundColor:COLOR_MAIN titleColor:RGBCOLOR(255, 255, 255) titleSize:Size(15)];
            [view addSubview:sureBtn];
            sureBtn.layer.cornerRadius = Size(5);
            [sureBtn addTarget:self action:@selector(doSureBtn) forControlEvents:UIControlEventTouchUpInside];
            [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_offset(Size(15));
                make.right.mas_offset(-Size(15));
                make.width.mas_equalTo(Size(316/2));
                make.height.mas_equalTo(Size(40));
            }];
            return view;
        }
    }
    FilterHeaderCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FilterHeader" forIndexPath:indexPath];
    view.backgroundColor = COLOR_BG;
    switch (indexPath.section) {
        case 0:
            view.titleLab.text = @"学历要求";
            break;
        case 1:
            view.titleLab.text = @"工作经验";
            break;
        case 2:
            view.titleLab.text = @"薪资";
            break;
        default:
            break;
    }
    return view;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, Size(70/2));
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(kScreenWidth, Size(136/2));
    }
    return CGSizeZero;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    //CGRect rect = [self.sureBtn convertRect:self.sureBtn.frame toView:_collectV];
    if (self.frame.size.height > _collectV.contentSize.height) {
        [self.collectV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_offset(- (self.height - _collectV.contentSize.height));
        }];
    }else{
        [self.collectV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_offset(0);
        }];
    }
   
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
