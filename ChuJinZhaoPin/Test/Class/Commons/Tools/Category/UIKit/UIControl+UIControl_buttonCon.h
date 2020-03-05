//
//  UIControl+UIControl_buttonCon.h
//  MaShangYin
//
//  Created by Monster on 2018/5/28.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultInterval .5 //默认时间间隔


@interface UIControl (UIControl_buttonCon)

@property(nonatomic,assign)NSTimeInterval timeInterval;//用这个给重复点击加间隔

@property(nonatomic,assign)BOOL isIgnoreEvent;//YES不允许点击NO允许点击



@end
