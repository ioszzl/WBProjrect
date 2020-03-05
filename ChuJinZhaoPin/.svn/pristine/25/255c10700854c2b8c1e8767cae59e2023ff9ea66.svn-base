//
//  HUD.m
//  yidianjiankang
//
//  Created by 孙若淮(SUNRUOHUAI135) on 17/2/23.
//  Copyright © 2017年 Monster. All rights reserved.
//

#import "HUD.h"

@implementation HUD


/**
 *  隐藏 HUD
 */
+ (void) dissmissShowView:(UIView *)showView {
    
    if (showView == nil) {
        
        showView = (UIView*)[[[UIApplication sharedApplication]delegate]window];
        
    }
    [MBProgressHUD hideHUDForView:showView animated:YES];

}

/**
 *  显示 HUD
 */

+ (instancetype) showHUDWithImageArr:(NSMutableArray *)imageArr andShowView:(UIView *)showView{
    
    if (showView == nil) {
        
        showView  = (UIView *)[[UIApplication sharedApplication].delegate window];
    }
    
    
    if (imageArr == nil) {
        
        HUD *hud = [self showHUDAddedTo:showView animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = @"正在加载...";

        return hud;
        
    } else {
        
        HUD *hud = [HUD showHUDAddedTo:showView animated:YES];
        
        hud.mode = MBProgressHUDModeCustomView;
        
        UIImageView *imaegCustomView = [[UIImageView alloc] init];
        imaegCustomView.animationImages = imageArr;
        [imaegCustomView setAnimationRepeatCount:0];
        [imaegCustomView setAnimationDuration:(imageArr.count + 1) * 0.075];
        [imaegCustomView startAnimating];
        
//        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        
//        hud.bezelView.color = [UIColor clearColor];
        
        hud.customView = imaegCustomView;
        
        hud.square = NO;
        
        return hud;
        
    }
}

+(instancetype)showHUDSuccess:(UIView *)showView title:(NSString *)title {
    if (showView == nil) {
        
        showView  = (UIView *)[[UIApplication sharedApplication].delegate window];
    }

    HUD *hud = [HUD showHUDAddedTo:showView animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_success"]];
    
    hud.label.text = title;
    [hud hideAnimated:YES afterDelay:1];// 延时2s消失
    return hud;
}

+(instancetype)showHUDError:(UIView *)showView title:(NSString *)title{
    if (showView == nil) {
        showView  = (UIView *)[[UIApplication sharedApplication].delegate window];
    }
    HUD *hud = [HUD showHUDAddedTo:showView animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_error"]];
    
    hud.label.text = title;
    [hud hideAnimated:YES afterDelay:1];// 延时2s消失
    return hud;

}


@end
