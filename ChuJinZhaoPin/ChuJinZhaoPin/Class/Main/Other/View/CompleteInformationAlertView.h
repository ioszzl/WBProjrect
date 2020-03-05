//
//  CompleteInformationAlertView.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/10/31.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 首页完善信息弹窗
 */
@interface CompleteInformationAlertView : UIView<UITextViewDelegate>{
    NSMutableAttributedString *_attrStr;
}
@property (nonatomic, strong) UITextView *contentTextV;
@property (nonatomic, strong) NSString *allStr;
@property (nonatomic, strong) NSString *hrefStr;


@property (nonatomic, copy) void(^skipBtnBlock)(void);
@property (nonatomic, copy) void(^completeInfoBlock)(void);
@end

NS_ASSUME_NONNULL_END
