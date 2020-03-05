//
//  UIView+Category.m
//  Test
//
//  Created by eims on 17/6/16.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/runtime.h>

@implementation UIView (Category)

#pragma mark - 控件Frame的扩展
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = ceilf(x);
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = ceilf(y);
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = ceilf(right - frame.size.width);
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = ceilf(bottom - frame.size.height);
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(ceilf(centerX), self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, ceilf(centerY));
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = ceilf(width);
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = ceilf(height);
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark - 控件视图处理

// 移除控件的所有子视图
- (void)ym_removeAllSubviews {
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

// 移除控件的某一个子视图
- (void)ym_removeSubviewAt:(NSInteger)index {
    
    if(index<self.subviews.count){
        UIView *view=self.subviews[index];
        [view removeFromSuperview];
    }
}

// 添加多个子视图
- (void)ym_addSubViews:(UIView *)view, ... {
    if (view) {
        [self addSubview:view];
        va_list argList;  //定义一个 va_list 指针来访问参数表
        va_start(argList, view);  //初始化 va_list，让它指向第一个变参，view 这里是第一个参数
        id arg;
        while ((arg = va_arg(argList, UIView *))) //调用 va_arg 依次取出 参数，它会自带指向下一个参数
        {
            if ([arg isKindOfClass:NSClassFromString(@"UIView")]) {
                [self addSubview:arg];
            }
            else{
                break;
            }
        }
        va_end(argList); // 收尾，记得关闭关闭 va_list

    }
}

// 添加多个子视图
//- (YMAddSubViews)ym_addSubViews {
//    return ^id(UIView *view, ...) {
//        if (view) {
//            [self addSubview:view];
//            va_list argList;  //定义一个 va_list 指针来访问参数表
//            va_start(argList, view);  //初始化 va_list，让它指向第一个变参，view 这里是第一个参数
//            id arg;
//            while ((arg = va_arg(argList, UIView *))) //调用 va_arg 依次取出 参数，它会自带指向下一个参数
//            {
//                if ([arg isKindOfClass:NSClassFromString(@"UIView")]) {
//                    [self addSubview:arg];
//                }
//                else{
//                    break;
//                }
//                
//            }
//            va_end(argList); // 收尾，记得关闭关闭 va_list
//        }
//        return self;
//    };
//
//}
#pragma mark - 获取该控件所属的控制器

/** 获取当前View的VC */
- (UIViewController *)ym_getCurrentViewController {
    for (UIView *view = self; view; view = view.superview)
    {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

/** 获取当前view的NAVI */
- (UINavigationController *)ym_getCurrentNavigationController {
    return [self ym_getCurrentViewController].navigationController;
}

@end
