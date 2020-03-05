//
//  ECCmdMessageBody.h
//  CCPiPhoneSDK
//
//  Created by ronglian on 16/8/11.
//  Copyright © 2016年 ronglian. All rights reserved.
//

#import "ECMessageBody.h"

@interface ECCmdMessageBody : ECMessageBody

/**
 @brief text 文本消息体的内部文本对象的文本
 */
@property (nonatomic, strong) NSString *text;

/**
 @brief isSave 是否存储该消息
 */
@property (nonatomic, assign) BOOL isSave;

/**
 @brief isHint 消息是否提示
 */
@property (nonatomic, assign) BOOL isHint;

/**
 @brief isSyncMsg 是否多设备同步
 */
@property (nonatomic, assign) BOOL isSyncMsg;

/**
 @brief text 是否离线推送
 */
@property (nonatomic, assign) ECOfflinePush offlinePush;

/**
 @brief 创建文本实例
 @param text 文本消息
 */
- (instancetype)initWithText:(NSString*)text;

@end
