//
//  YMTablePlaceholderView.h
//  Test
//
//  Created by eims on 17/6/20.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, YMTablePlaceholderViewType)
{
    YMTablePlaceholderViewTypeEmpty = 0,
    YMTablePlaceholderViewTypeError,
};

@interface YMTablePlaceholderView : UIView
/**
 显示的图片
 */
@property (nonatomic, strong) UIImageView *imageView;

/**
 显示的标题
 */
@property (nonatomic, strong) UILabel *label;

@end

@interface UITableView (EmptyPlaceholder)


/**
 添加一个空视图在页面上
 
 @param type 类型，0空页面  1错误页面
 @param message 展示的文字
 */
- (void)ym_checkEmptyWithType:(YMTablePlaceholderViewType)type message:(NSString *)message;

/**
 移除空视图
 */
- (void)ym_removeEmptyView;


@end
