//
//  BaseModel.h
//  TestDemo
//
//  Created by 孙若淮 on 14/03/2018.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface BaseModel : NSObject
/**
 请求返回信息（非数据）
 */
@property (nonatomic , copy) NSString * msg;

/**
 请求返回状态
 */
@property (nonatomic , assign) NSInteger code;

@end
