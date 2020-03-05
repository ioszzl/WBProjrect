//
//  CJAlertView.h
//  Test
//
//  Created by eims on 2018/11/16.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJAlertView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLab;

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *btnTitleArr;
@property (nonatomic, strong) NSMutableArray<UIButton *> *btnMuArr;
@property (nonatomic, copy) void(^buttonClick)(NSInteger index);

+(instancetype)CJAlertViewWithTitle:(NSString *)title message:(NSString *)message btnTitleArr:(NSArray *)btnTitleArr BtnBlock:(void(^)(NSInteger index))block;

+(instancetype)CJAlertViewWithTitle:(NSString *)title messageAlignment:(NSTextAlignment)alignment message:(NSString *)message btnTitleArr:(NSArray *)btnTitleArr BtnBlock:(void(^)(NSInteger index))block;

-(void)show;
@end

NS_ASSUME_NONNULL_END
