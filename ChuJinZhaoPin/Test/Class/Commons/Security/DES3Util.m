//
//  DES3Util.m
//  Skyworth2
//
//  Created by md002 on 13-7-16.
//  Copyright (c) 2013年 md005. All rights reserved.
//

#import "DES3Util.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"
#import "NetWorkConfig.h"

@implementation DES3Util

+ (NSString *)encrypt:(NSString*)plainText {
    
    NSString *sss = [NSString stringWithFormat:@"%@",plainText];
    
    NSData* data = [sss dataUsingEncoding:NSUTF8StringEncoding];
    
    
    
    
    size_t plainTextBufferSize = [data length];
    const void *vplainText = (const void *)[data bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    NSString *key = DES3_KEY;
    const void *vkey = (const void *)[key UTF8String];

    NSString *initVec = DES3_IV;
    const void *vinitVec = (const void *) [initVec UTF8String];
    
    ccStatus = CCCrypt(kCCEncrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
    NSString *result = [GTMBase64 stringByEncodingData2:myData];
    free(bufferPtr);
    return result;
}

// 解密方法
+ (NSString *)decrypt:(NSString*)encryptText
{
    NSData *encryptData = [GTMBase64 decodeData:[encryptText dataUsingEncoding:NSUTF8StringEncoding]];
    size_t plainTextBufferSize = [encryptData length];
    const void *vplainText = [encryptData bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    NSString *key = DES3_KEY;
    const void *vkey = (const void *)[key UTF8String];
    
    NSString *initVec = DES3_IV;
    const void *vinitVec = (const void *) [initVec UTF8String];

    ccStatus = CCCrypt(kCCDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSString *result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                                     length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding];
    free(bufferPtr);
    return result;
}

/**
 *  @brief 对支付前接口做解密处理
 *
 *  @param response <#response description#>
 *
 *  @return <#return value description#>
 */
+(NSDictionary *) decodeBeforePayResult:(NSDictionary *) response
{
    NSString *mKey = [NSString ym_stringUtils:[response objectForKey:@"mkey"]];
    /**
     *  加密解密的bug，需要把特殊的符号被代替。
     */
    mKey = [mKey stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
    mKey = [mKey stringByReplacingOccurrencesOfString:@"**" withString:@"hh"];
    //解密
    mKey = [DES3Util decrypt:mKey];
    
    //重新组建字典返回
    NSData *data = [mKey dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *newResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSLog(@"newResponse...%@",newResponse);
    return newResponse;
}

@end
