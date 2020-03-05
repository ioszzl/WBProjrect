//
//  Macros.h
//  TestDemo
//
//  Created by 孙若淮 on 14/03/2018.
//  Copyright © 2018 Monster. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#import "AppDelegate.h"

// =====================================================================
// 应用程序总代理
#define AppDelegateInstance         ((AppDelegate*)([UIApplication sharedApplication].delegate))
#define kKeyWindow [UIApplication sharedApplication].keyWindow


// =====================================================================

// 获取当前操作系统的版本
#define SYSTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]

// 操作系统是否大于等于iOS5
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)

// 操作系统是否大于等于iOS6
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)

// 操作系统是否大于等于iOS7
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

// 操作系统是否大于等于iOS8
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

// 操作系统是否大于等于iOS9
#define IS_OS_9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

// 操作系统是否大于等于iOS10
#define IS_OS_10_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

//======================================================================

// 是否为3.5尺 /320 *480 iPhone4/iPhone4s
#define ThreeFiveInch ([UIScreen mainScreen].bounds.size.height == 480.0)
// 是否为4尺 /320 *568 iPhone5/iPhone5s
#define FourInch ([UIScreen mainScreen].bounds.size.height == 568.0)
// 是否为4.7尺 / 375 *667 iPhone6
#define FourSevenInch ([UIScreen mainScreen].bounds.size.height == 667.0)
// 是否为5.5尺 / 414 * 736 iPhone6 Plus
#define FiveFiveInch ([UIScreen mainScreen].bounds.size.height == 736.0)


// 判断是否iPhone设备或者iPhone 模拟器
#define IS_IPHONE                                  ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone" ] || [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone Simulator" ])
// 判断是否iPOD
#define IS_IPOD                                    ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPod touch" ] )

// 判断是否iPad
#define is_PAD                                       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


/****************************************打印控制***************************************/

#ifndef __OPTIMIZE__    //测试阶段
#define NSLog(...) NSLog(__VA_ARGS__)
#else   //发布阶段
#define NSLog(...){}
#endif

// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

// 应用主窗口
#define kKeyWindow [UIApplication sharedApplication].keyWindow

// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
/**UITabBar高度*/
#define kTabBarHeight  ( (IPHONEX)?83:49 )
/** Bar 的高度*/
#define kNavBarHeight   ( (IPHONEX)?88:64)
/** StatusBar 的高度*/
#define kStatusHeight   ( (IPHONEX)?44:(SYSTEM_VERSION>=11.0?20:0))
/** Bar 的高度*/
#define kSecrityHeight  ( (IPHONEX)?34:0 )

// 弱引用
#define WEAKSELF typeof(self) __weak weakSelf = self
#define WeakSelf(type)  __weak typeof(type) weak##type = type;


// iPhone 6,iPhone 6Plus适配等比放大控件
#define Size(x) ((x)*MIN(kScreenWidth,kScreenHeight)/375.0f)


//判断iPhoneX
//#define IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)]  ? CGSizeEqualToSize([UIScreen mainScreen].currentMode.size, CGSizeMake(1125,2436)) : NO)
#define IPHONEX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


// =====================================================================

#define BLOCK_EXEC(block, ...) if (block) block(__VA_ARGS__)

#define WEAKSELF typeof(self) __weak weakSelf = self
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;

#define MD5_KEY @""

#define DES3_KEY        @"eimseimseim@wmc1i0t0y$h#o3u6s5e#$"
#define DES3_IV         @"20170601"

#define Private_KEY     @""
#define Public_KEY      @""
//======================================================================

/**
 默认图片
 */
#define IMAGEDEFAULT [UIImage imageNamed:@"image_default_square"]
#define IMAGEDEFAULT_HEAD     [UIImage imageNamed:@"image_default_head"]
#define IMAGEDEFAULT_RECTANGLE    [UIImage imageNamed:@"image_default_rectangle"]

#define BaseImageUrl @""

/**
 请求的每页多少条
 
 */
#define PAGESIZE   @"15"


#endif /* Macros_h */
