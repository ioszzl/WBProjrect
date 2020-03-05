//
//  ConpanyPictureView.h
//  Test
//
//  Created by zzl on 2018/11/4.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConpanyPictureView : UIView
@property(nonatomic,strong) UIImageView *imgV;
@property(nonatomic,strong) NSMutableArray<UIButton *> *btnArr;

@property(nonatomic,copy) void(^btnBlock)(UIButton *btn);
@end

NS_ASSUME_NONNULL_END
