//
//  YMTextView.h
//  Commect
//
//  Created by cassfile on 2017/6/16.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>
/**工具类  创建textView 带placeholder*/
@interface YMTextView : UITextView

/**
 设置textView 的 placeHolder
 */
@property (copy, nonatomic) IBInspectable NSString *placeholder;

/**
 设置textView的placeHolder的 attributedText
 */
@property (copy, nonatomic) NSAttributedString *attributedPlaceholder;
/**
 设置textView 的 placeHolder的颜色
 */
@property (retain, nonatomic) UIColor *placeholderTextColor UI_APPEARANCE_SELECTOR;

@end
