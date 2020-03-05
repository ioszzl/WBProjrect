//
//  ZHShareTool.h
//
//
//  Created by zhaohaohao on 2018/11/22.
//  Copyright © 2018年 eims. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMShare/UMShare.h>

/**
 使用示例：
 
 NSMutableDictionary *dic = [NSMutableDictionary dictionary];
 dic[@"title"]  = @"心求民宿房东招募！";
 dic[@"descr"]  = @"心求民宿，新锐在线短租平台，邀您共创民宿新体验!";
 dic[@"imagesStr"]  = @"alivcHeatCount";
 dic[@"webpageUrl"] =  @"https://www.baidu,com";
 [DTShareTool shareWithDic:dic shareCompletionBlock:nil];

 */
typedef void(^ShareCompletionBlock)(BOOL success,UMSocialPlatformType platformType);

@interface ZHShareTool : NSObject

+ (void)shareWithDic:(NSDictionary *)dic shareCompletionBlock:(ShareCompletionBlock)shareCompletionBlock;

@end
