//
//  ZLDatePickerView.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/30.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum{
    DateStyleShowYearMonth = 0,
    DateStyleShowYearMonthDay,
    DateStyleShowYearMonthDayHourMinute,
}YMDateStyle;

@interface ZLDatePickerView : UIView
@property (nonatomic,assign)YMDateStyle datePickerStyle;//选择器的类型
@property (nonatomic,strong)UIColor *themeColor;//设置确认按钮的文字颜色
@property (nonatomic, copy) void(^doneBlock)(NSDate *date);


/**
 初始化
 
 @param x 坐标x
 @param y 坐标y
 @param width 宽度
 @param height 高度
 @return <#return value description#>
 */
-(id)initWithUI:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

//滚动到指定的时间位置
- (void)getNowDate:(NSDate *)date animated:(BOOL)animated;
/**
 弹出view
 */
-(void)show;

@end

NS_ASSUME_NONNULL_END
