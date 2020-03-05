//
//  DES3Util.h
//  Skyworth2
//
//  Created by md002 on 13-7-16.
//  Copyright (c) 2013年 md005. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DES3Util : NSObject

// 加密方法
+ (NSString*)encrypt:(NSString*)plainText;

/**
 账号密码加密
 */
+ (NSString*)encryptPWD:(NSString *)plainText;

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText;

/**
 *  @brief 对支付前接口做解密处理
 *
 *  @param response <#response description#>
 *
 *  @return <#return value description#>
 */
+(NSDictionary *) decodeBeforePayResult:(NSDictionary *) response;

@end
