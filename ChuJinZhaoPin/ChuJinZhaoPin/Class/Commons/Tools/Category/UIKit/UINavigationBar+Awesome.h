//
//  UINavigationBar+Awesome.h
//  LTNavigationBar
//
//  Created by hzy sunny on 2016-08-08
//  Copyright (c) 2016 eims. All rights reserved.
//
//使用方法为 进来设置颜色未clearColor 退出页面移除reset  改类用于实现进来透明导航栏，上滑到设置的距离时候渐变显示导航栏
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    
//    CGFloat offsetY = scrollView.contentOffset.y;
//    
//    if (offsetY > -164) {
//        CGFloat alpha = MIN(1, 1 - (0- (offsetY+100)) / 64);
//        [self.navigationController.navigationBar ym_setBackgroundColor:[NAVI_COLOR colorWithAlphaComponent:alpha]];
//        self.title = self.detailModel.returnMap.title;
//        
//    } else {
//        [self.navigationController.navigationBar ym_setBackgroundColor:[NAVI_COLOR colorWithAlphaComponent:0]];
//        self.title = @"";
//        
//    }
//}


#import <UIKit/UIKit.h>

@interface UINavigationBar (Awesome)

/** 设置导航栏的背景颜色 */
- (void)ym_setBackgroundColor:(UIColor *)backgroundColor;

/** 设置导航栏往下偏移度*/
- (void)ym_setTranslationY:(CGFloat)translationY;

/** 移除透明度 */
- (void)ym_reset;

@end
