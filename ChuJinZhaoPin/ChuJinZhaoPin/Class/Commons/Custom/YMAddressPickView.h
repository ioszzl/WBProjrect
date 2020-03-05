//
//  AddressPickView.h
//  yidianjiankang
//
//  Created by eims on 17/3/24.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <UIKit/UIKit.h>
/*地址选择器*/
@interface YMAddressPickView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
//+ (instancetype)shareInstance;

-(id)initWithUI:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

@property(nonatomic,copy)void (^AdressBlock) (NSString *province,NSString *city,NSString *town,NSString* pid,NSString* cid,NSString* tid);


/**
 展示视图
 */
-(void)showBottomView;

@end

