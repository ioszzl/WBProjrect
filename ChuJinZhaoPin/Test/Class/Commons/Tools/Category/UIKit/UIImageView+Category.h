//
//  UIImageView+Category.h
//  Test
//
//  Created by eims on 17/6/20.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Category)

/** 图片播放效果动画 图片循环 */
- (void)ym_pictureChangeAnimationSetting:(NSArray *)picArray;

/** 改变图片的大小 */
- (void)ym_initImageSize:(CGSize)imgSize;

#pragma mark - 控件属性的扩展

+ (instancetype)ym_imageViewWithFrame:(CGRect)frame UIImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;


@end
