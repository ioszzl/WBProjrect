//
//  CJChoseAlertView.h
//  Test
//
//  Created by eims on 2018/11/16.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJChoseAlertView : UIView
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) NSArray *choseBtnTitleArr;
@property (nonatomic, strong) NSArray *btnTitleArr;
@property (nonatomic, strong) NSMutableArray<UIButton *> *btnMuArr;
@property (nonatomic, copy) void(^buttonClick)(NSInteger index, NSInteger choseIndex);

+(instancetype)CJChoseAlertViewWithTitle:(NSString *)title ChoseBtnTitleArr:(NSArray *)choseBtnTitleArr btnTitleArr:(NSArray *)btnTitleArr BtnBlock:(void(^)(NSInteger index, NSInteger choseIndex))block;

-(void)show;
@end

NS_ASSUME_NONNULL_END
