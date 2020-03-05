//
//  ActionSheetShareView.h
//  MaShangYin
//
//  Created by eims on 2018/6/4.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionSheetShareView : UIView

/**
 分享block btntitle 平台名称（微信、钉钉、QQ）
 */
@property (nonatomic, copy) void(^shareBtnBlock) (NSString *btnTitle);

-(void)show;
@end
