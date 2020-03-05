//
//  ShoveGeneralRestGateway.m
//  Shove
//
//  Created by 英迈思实验室移动开发部 on 14-8-28.
//  Copyright (c) 2014年 EIMS. All rights reserved.
//
// 通用的 REST 类型的网关

#import "ShoveGeneralRestGateway.h"

#import "NSString+Shove.h"

#import "NSString+Extension.h"

#import "DES3Util.h"

@implementation ShoveGeneralRestGateway
/**旧验签方法*/
+ (NSString *) getSignData:(NSMutableDictionary  *)parameters
{
    NSArray *parameterNames = [parameters allKeys];
    parameterNames = [parameterNames sortedArrayUsingSelector:@selector(compare:)];// 字符串编码升序排序
    
    NSString *signData = @"";
    
    for (int i = 0; i < [parameters count]; i++) {
        NSString *_key = parameterNames[i];
        if(_key != nil)
        {
            NSString * _value = parameters[_key];
            NSLog(@"加密前：_value=%@", _value);
           
            NSString *_value1 = [DES3Util encrypt:_value];
            NSLog(@"加密后：_value=%@", _value1);
            
            signData = [signData stringByAppendingString:_value1];
            
        }
    }
   
    return [[signData stringByAppendingString:MD5_KEY] md5];
}

/**新验签方法*/
+ (NSString *) getNewSignData:(NSMutableDictionary  *)parameters
{
    NSArray *parameterNames = [parameters allKeys];
    parameterNames = [parameterNames sortedArrayUsingSelector:@selector(compare:)];// 字符串编码升序排序
    
    NSString *signData = nil;
    for (int i = 0; i < [parameters count]; i++) {
        NSString *_key = parameterNames[i];
        NSString * _value = parameters[_key];
        if(_key != nil && ![[NSString ym_stringUtils:_value] isEqualToString:@""])
        {
            NSString *keyValueStr = [NSString stringWithFormat:@"%@=%@",_key,_value];
            if (!signData) {
                signData = keyValueStr;
            }else{
                signData = [signData stringByAppendingString:[NSString stringWithFormat:@"&%@",keyValueStr]];
            }
        }
    }
    
    return [[signData stringByAppendingString:Private_KEY] md5];
}

@end
