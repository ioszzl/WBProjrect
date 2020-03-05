//
//  ZLDatePickerView.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/30.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "ZLDatePickerView.h"
#import "NSDate+Utilities.h"

#define kPickerSize self.buttomView.frame.size
#define MAXYEAR 2100
#define MINYEAR 1970

@interface ZLDatePickerView()<UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate>
{
    //日期存储数组
    NSMutableArray *_yearArray;
    NSMutableArray *_monthArray;
    NSMutableArray *_dayArray;
    NSString *_dateFormatter;
    //记录位置
    NSInteger yearIndex;
    NSInteger monthIndex;
    NSInteger dayIndex;
    
    NSDate *_startDate;
    
    //时间数组
    NSMutableArray *_hourArr;
    NSMutableArray *_minuteArr;
    //位置
    NSInteger hourIndex;
    NSInteger minuteIndex;
}

@property (nonatomic,strong) UIView *buttomView;
@property (nonatomic,strong)UIPickerView *datePicker;
@property (nonatomic,retain) NSDate *scrollToDate;//滚到指定日期
@property (nonatomic, strong) UIButton * doneBtn;
@property (nonatomic, strong) UIButton * cancelBtn;


@end

@implementation ZLDatePickerView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _dateFormatter = @"yyyy-MM-dd HH:mm";
        [self defaultConfig];
    }
    return self;
}


/**
 datepicker
 
 @param x 坐标x
 @param y 坐标y
 @param width 宽度
 @param height 高度
 @return <#return value description#>
 */
-(id)initWithUI:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height{
    self = [super init];
    if (self) {
        self.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self setBackgroundColor:[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.3]];
        
        self.buttomView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        self.buttomView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.buttomView];
        
        //点击背景是否影藏
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        
        self.doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.doneBtn setFrame:CGRectMake(width-90, 0, 80, 50)];
        [self.doneBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.doneBtn addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.doneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.buttomView addSubview:self.doneBtn];
        
        self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelBtn setFrame:CGRectMake(10, 0, 80, 50)];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelBtn addTarget:self action:@selector(calcelAction) forControlEvents:UIControlEventTouchUpInside];
        [self.cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.buttomView addSubview:self.cancelBtn];
        
        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
        [self.buttomView addSubview:self.datePicker];
    }
    return self;
}

-(void)defaultConfig {
    //设置年月日时分数据
    _yearArray = [self setArray:_yearArray];
    _monthArray = [self setArray:_monthArray];
    _dayArray = [self setArray:_dayArray];
    
    for (int i=0; i<60; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d月",i];
        if (0<i && i<=12)
            [_monthArray addObject:num];
    }
    for (NSInteger i=MINYEAR; i<MAXYEAR; i++) {
        NSString *num = [NSString stringWithFormat:@"%ld年",(long)i];
        [_yearArray addObject:num];
    }
    
    _hourArr = [self setArray:_hourArr];
    _minuteArr = [self setArray:_minuteArr];
    for (int i=0; i<24; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d时",i];
        [_hourArr addObject:num];
    }
    for (int i=0; i<60; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d分",i];
        [_minuteArr addObject:num];
    }
}

- (NSMutableArray *)setArray:(id)mutableArray
{
    if (mutableArray)
        [mutableArray removeAllObjects];
    else
        mutableArray = [NSMutableArray array];
    return mutableArray;
}

#pragma mark - UIPickerViewDelegate,UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDay:
            return 3;
        case DateStyleShowYearMonth:
            return 2;
        case DateStyleShowYearMonthDayHourMinute:
            return 5;
        default:
            return 0;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSArray *numberArr = [self getNumberOfRowsInComponent];
    return [[numberArr objectAtIndex:component]integerValue];
}

-(NSArray *)getNumberOfRowsInComponent {
    
    NSInteger yearNum = _yearArray.count;
    NSInteger monthNum = _monthArray.count;
    NSInteger dayNum = [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
    NSInteger hourNum = _hourArr.count;
    NSInteger minuteNum = _minuteArr.count;
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonth:
            return @[@(yearNum),@(monthNum)];
            break;
        case DateStyleShowYearMonthDay:
            return @[@(yearNum),@(monthNum),@(dayNum)];
            break;
        case DateStyleShowYearMonthDayHourMinute:
            return @[@(yearNum),@(monthNum),@(dayNum),@(hourNum),@(minuteNum)];
            break;
        default:
            return @[];
            break;
    }
    
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *customLabel = (UILabel *)view;
    if (!customLabel) {
        customLabel = [[UILabel alloc] init];
        customLabel.textAlignment = NSTextAlignmentCenter;
        [customLabel setFont:[UIFont systemFontOfSize:17]];
    }
    NSString *title;
    
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDay:
            if (component==0) {
                title = _yearArray[row];
            }
            if (component==1) {
                title = _monthArray[row];
            }
            if (component==2) {
                title = _dayArray[row];
            }
            break;
        case DateStyleShowYearMonth:
            if (component==0) {
                title = _yearArray[row];
            }
            if (component==1) {
                title = _monthArray[row];
            }
            break;
        case DateStyleShowYearMonthDayHourMinute:
            if (component==0) {
                title = _yearArray[row];
            }
            if (component==1) {
                title = _monthArray[row];
            }
            if (component==2) {
                title = _dayArray[row];
            }
            if (component==3) {
                title = _hourArr[row];
            }
            if (component==4) {
                title = _minuteArr[row];
            }
            break;
        default:
            title = @"";
            break;
    }
    
    customLabel.text = title;
    customLabel.textColor = [UIColor blackColor];
    return customLabel;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (self.datePickerStyle) {
        case DateStyleShowYearMonthDay:{
            
            if (component == 0) {
                yearIndex = row;
            }
            if (component == 1) {
                monthIndex = row;
            }
            if (component == 2) {
                dayIndex = row;
            }
            if (component == 0 || component == 1){
                [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
                
                
            }
        }
            break;
            
            
        case DateStyleShowYearMonth:{
            
            if (component == 0) {
                yearIndex = row;
            }
            if (component == 1) {
                monthIndex = row;
            }
            
            [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
            
        }
            break;
        case DateStyleShowYearMonthDayHourMinute:{
            
            if (component == 0) {
                yearIndex = row;
            }
            if (component == 1) {
                monthIndex = row;
            }
            if (component == 2) {
                dayIndex = row;
            }
            if (component == 3) {
                hourIndex = row;
            }
            if (component == 4) {
                minuteIndex = row;
            }
            if (component == 0 || component == 1){
                [self DaysfromYear:[_yearArray[yearIndex] integerValue] andMonth:[_monthArray[monthIndex] integerValue]];
                if (_dayArray.count-1<dayIndex) {
                    dayIndex = _dayArray.count-1;
                }
                
                
            }
        }
            break;
        default:
            break;
    }
    
    [self.datePicker reloadAllComponents];
    
    NSString *dateStr = [NSString stringWithFormat:@"%ld-%02ld-%02ld %02ld:%02ld",[_yearArray[yearIndex] integerValue],[_monthArray[monthIndex] integerValue],[_dayArray[dayIndex] integerValue],[_hourArr[hourIndex] integerValue],[_minuteArr[minuteIndex] integerValue]];
    
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd HH:mm";
    
    NSDate *date = [format dateFromString:dateStr];
    
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate:date];
//
//
//    _startDate = [date dateByAddingTimeInterval:interval];
    _startDate = date;
    NSLog(@"scrollToDate %@",_startDate);
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if( [touch.view isDescendantOfView:self.buttomView]) {
        return NO;
    }
    return YES;
}

#pragma mark - Action

-(void)show{
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    [UIView animateWithDuration:0.2 animations:^{
        //        [self.buttomView setFrame:CGRectMake(x, y, width , height)];
    } completion:nil];
}

/**
 消失
 */
-(void)dismiss {
    [self.buttomView setFrame:CGRectMake(0, 0, 0, 0)];
    [self removeFromSuperview];
}


/**
 点击确认按钮
 
 @param btn <#btn description#>
 */
- (void)doneAction:(UIButton *)btn {
    if (self.doneBlock) {
        self.doneBlock(_startDate);
    }
    
    [self dismiss];
}

/**
 取消按钮
 */
-(void)calcelAction{
    [self dismiss];
}

#pragma mark - tools
//通过年月求每月天数
- (NSInteger)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month
{
    NSInteger num_year  = year;
    NSInteger num_month = month;
    
    BOOL isrunNian = num_year%4==0 ? (num_year%100==0? (num_year%400==0?YES:NO):YES):NO;
    switch (num_month) {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:{
            [self setdayArray:31];
            return 31;
        }
        case 4:case 6:case 9:case 11:{
            [self setdayArray:30];
            return 30;
        }
        case 2:{
            if (isrunNian) {
                [self setdayArray:29];
                return 29;
            }else{
                [self setdayArray:28];
                return 28;
            }
        }
        default:
            break;
    }
    return 0;
}

//设置每月的天数数组
- (void)setdayArray:(NSInteger)num
{
    [_dayArray removeAllObjects];
    _dayArray = [NSMutableArray array];
    for (int i=1; i<=num; i++) {
        [_dayArray addObject:[NSString stringWithFormat:@"%d日",i]];
        //[_dayArray addObject:[@(i) stringValue]];
    }
}

#pragma mark - getter / setter
-(UIPickerView *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, kPickerSize.width, kPickerSize.height - 50)];
        _datePicker.showsSelectionIndicator = YES;
        _datePicker.delegate = self;
        
        _datePicker.dataSource = self;
    }
    return _datePicker;
}


/**
 设置确认按钮的文字颜色
 
 @param themeColor <#themeColor description#>
 */
-(void)setThemeColor:(UIColor *)themeColor {
    _themeColor = themeColor;
    [self.doneBtn setTitleColor:themeColor forState:UIControlStateNormal];
}

-(void)setDatePickerStyle:(YMDateStyle)datePickerStyle {
    _datePickerStyle = datePickerStyle;
    _startDate = [NSDate date];
    [self getNowDate:_startDate animated:YES];
}

//滚动到指定的时间位置
- (void)getNowDate:(NSDate *)date animated:(BOOL)animated
{
    if (!date) {
        date = [NSDate date];
    }
    _startDate = date;
    [self DaysfromYear:date.year andMonth:date.month];
    
    yearIndex = date.year-MINYEAR;
    monthIndex = date.month-1;
    dayIndex = date.day-1;
    hourIndex = date.hour;
    minuteIndex = date.minute;
    NSArray *indexArray;
    if (self.datePickerStyle == DateStyleShowYearMonth){
        indexArray = @[@(yearIndex),@(monthIndex)];
    }
    
    if (self.datePickerStyle == DateStyleShowYearMonthDay){
        indexArray = @[@(yearIndex),@(monthIndex),@(dayIndex)];
    }
    
    if (self.datePickerStyle == DateStyleShowYearMonthDayHourMinute){
        indexArray = @[@(yearIndex),@(monthIndex),@(dayIndex),@(hourIndex),@(minuteIndex)];
    }
    
    for (int i=0; i<indexArray.count; i++) {
        [self.datePicker selectRow:[indexArray[i] integerValue] inComponent:i animated:animated];
        
    }
    [self.datePicker reloadAllComponents];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end