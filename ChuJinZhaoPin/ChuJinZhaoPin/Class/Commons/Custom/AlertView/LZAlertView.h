//
//  LZAlertView.h
//  TestDemo
//
//  Created by eims on 2018/6/21.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZAlertView : UIView
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *btnArr;

@property (nonatomic, copy) void(^buttonClick)(NSInteger index);

+(instancetype)LZAlertViewWithTitle:(NSString *)title message:(NSString *)message btnArr:(NSArray *)btnArr BtnBlock:(void(^)(NSInteger index))block;

-(void)show;
@end
