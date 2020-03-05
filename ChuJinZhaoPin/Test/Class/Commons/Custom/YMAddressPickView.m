//
//  AddressPickView.m
//  yidianjiankang
//
//  Created by eims on 17/3/24.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "YMAddressPickView.h"
#import "AddressModel.h"
#import <MJExtension.h>
#import "UIView+Category.h"
#define pickViewViewHeight 250
#define buttonWidth 60

@interface YMAddressPickView ()
@property(nonatomic,strong)NSDictionary *pickerDic;
@property(nonatomic,strong)NSMutableArray *provinceArray;
@property(nonatomic,strong)NSMutableArray *selectedArray;
@property(nonatomic,strong)NSArray *cityArray;//城市
@property(nonatomic,strong)NSArray *townArray;//乡镇
@property(nonatomic,strong)UIView *bottomView;//包括导航视图和地址选择视图
@property(nonatomic,strong)UIPickerView *pickView;//地址选择视图
@property(nonatomic,strong)UIView *navigationView;//上面的导航视图
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)AddressModel        * model;
@end
@implementation YMAddressPickView

-(id)initWithUI:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self _addTapGestureRecognizerToSelf];
        [self _getPickerData];
        height = pickViewViewHeight;
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        [self addSubview:_bottomView];
        //导航视图
        _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 40)];
        _navigationView.backgroundColor = [UIColor whiteColor];
        [_bottomView addSubview:_navigationView];
        //这里添加空手势不然点击navigationView也会隐藏,
        UITapGestureRecognizer *tapNavigationView = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
        [_navigationView addGestureRecognizer:tapNavigationView];
        NSArray *buttonTitleArray = @[@"取消",@"确定"];
        for (int i = 0; i <buttonTitleArray.count ; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            if (i == 0) {
                button.frame = CGRectMake(0, 0, buttonWidth, 40);
            }
            else{
                button.frame = CGRectMake(width-buttonWidth, 0, buttonWidth, 40);
            }
            [button setTitle:buttonTitleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [_navigationView addSubview:button];
            
            button.tag = i;
            [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
        }
        _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,_navigationView.bottom, width, height - 40)];
        _pickView.backgroundColor = [UIColor whiteColor];
        _pickView.dataSource = self;
        _pickView.delegate =self;
        [_bottomView addSubview:_pickView];
    }
    return self;
}
#pragma mark - get data
- (void)_getPickerData
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CJAddress" ofType:@"plist"];
    self.pickerDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    self.model = [AddressModel mj_objectWithKeyValues:self.pickerDic];
    
    self.provinceArray = [NSMutableArray array];
    self.selectedArray = [NSMutableArray array];
    for (ProvinceData *province in self.model.data) {
        [self.provinceArray addObject:province.name];
        
    }
    NSMutableDictionary *cityDic = [NSMutableDictionary dictionary];
    NSMutableArray *townArr = [NSMutableArray array];
    [self.selectedArray addObject:cityDic];
    for (CityData *city in [self.model.data firstObject].data) {
        for (AreaData *town in city.data) {
            [townArr addObject:town.name];
        }
        [cityDic setValue:townArr forKey:city.name];
    }
    
    if (self.selectedArray.count > 0) {
        self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
    }
    
    if (self.cityArray.count > 0) {
        self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
    }
    
}

/**
 添加手势
 */
-(void)_addTapGestureRecognizerToSelf
{
    self.bgView = [[UIView alloc]initWithFrame:self.bounds];
    self.bgView.backgroundColor = [UIColor blackColor];
    self.bgView.alpha = 0.5;
    [self addSubview:self.bgView];
    self.bgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenBottomView)];
    [self.bgView addGestureRecognizer:tap];
}


/**
 点击确认button

 @param button <#button description#>
 */
-(void)tapButton:(UIButton*)button
{
    //点击确定回调block
    if (button.tag == 1) {
        
        NSString *province = [self.provinceArray objectAtIndex:[_pickView selectedRowInComponent:0]];
        NSString *city = [self.cityArray objectAtIndex:[_pickView selectedRowInComponent:1]];
        NSString *town = [self.townArray objectAtIndex:[_pickView selectedRowInComponent:2]];
        
        NSString *provinceId;
        NSString *cityId;
        NSString *townId;
        for (ProvinceData *p in self.model.data) {
            if ([p.name isEqualToString:province]) {
                provinceId = [NSString stringWithFormat:@"%ld",p.ID];
                for (CityData *c in p.data) {
                    if ([c.name isEqualToString:city]) {
                        cityId = [NSString stringWithFormat:@"%ld",c.ID];
                        for (AreaData *t in c.data) {
                            if ([t.name isEqualToString:town]) {
                                townId = [NSString stringWithFormat:@"%ld",t.ID];
                                break;
                            }
                        }
                    }
                }
            }
        }
        if (self.AdressBlock) {
           self.AdressBlock(province,city,town,provinceId,cityId,townId);
        }
        
    }
    
    [self hiddenBottomView];
    
    
}

/**
 弹出地址选择器
 */
-(void)showBottomView
{
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    self.top = 0;
    [UIView animateWithDuration:0.3 animations:^{
        _bottomView.top = kScreenHeight-pickViewViewHeight;
    } completion:^(BOOL finished) {
    }];
}

/**
 隐藏地址选择器
 */
-(void)hiddenBottomView
{
    [UIView animateWithDuration:0.3 animations:^{
        _bottomView.top = kScreenHeight;
    } completion:^(BOOL finished) {
        self.top = kScreenHeight;
    }];
    
}


#pragma mark - UIPicker Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _provinceArray.count;
    } else if (component == 1) {
        return _cityArray.count;
    } else {
        return _townArray.count;
    }
}


-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *lable=[[UILabel alloc]init];
    lable.textAlignment=NSTextAlignmentCenter;
    lable.font=[UIFont systemFontOfSize:15];
    lable.textColor = [UIColor blackColor];
    if (component == 0) {
        lable.text=[self.provinceArray objectAtIndex:row];
    } else if (component == 1) {
        lable.text=[self.cityArray objectAtIndex:row];
    } else {
        lable.text=[self.townArray objectAtIndex:row];
    }
    return lable;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat pickViewWidth = kScreenWidth/3;
    
    return pickViewWidth;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        [self.selectedArray removeAllObjects];
        
        NSMutableDictionary *cityDic = [NSMutableDictionary dictionary];
        [self.selectedArray addObject:cityDic];
        for (CityData *cityArr in [self.model.data objectAtIndex:row].data) {
            NSMutableArray *townArr = [NSMutableArray array];
            for (AreaData *town in cityArr.data) {
                [townArr addObject:town.name];
            }
            [cityDic setValue:townArr forKey:cityArr.name];
        }
        if (self.selectedArray.count > 0) {
            self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
        } else {
            self.cityArray = nil;
        }
        if (self.cityArray.count > 0) {
            self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
        } else {
            self.townArray = nil;
        }
        
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
        
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    //[pickerView selectedRowInComponent:1];
    
    //[pickerView selectedRowInComponent:2];
    
    if (component == 1) {
        if (self.selectedArray.count > 0 && self.cityArray.count > 0) {
            self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:row]];
        } else {
            self.townArray = nil;
        }
        
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
        
        [pickerView selectRow:0 inComponent:2 animated:YES];
    }
    
    //[pickerView reloadComponent:2];
}


@end
