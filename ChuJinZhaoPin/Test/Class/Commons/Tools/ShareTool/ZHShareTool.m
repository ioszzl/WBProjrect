//
//  ZHShareTool
//  
//
//  Created by zhaohaohao on 2018/11/22.
//  Copyright © 2018年 eims. All rights reserved.
//

#import "ZHShareTool.h"
#import <UMCommon/UMCommon.h>
#import <UShareUI/UShareUI.h>

static ShareCompletionBlock _block;


@implementation ZHShareTool

+ (void)shareWithDic:(NSDictionary *)dic shareCompletionBlock:(ShareCompletionBlock)shareCompletionBlock{

    
    NSString *title = dic[@"title"];
    NSString *descr = dic[@"descr"];
    NSString  *imagesStr = dic[@"imagesStr"];
    NSString  *webpageUrl = dic[@"webpageUrl"];
    
     NSArray *baseDisplaySnsPlatforms =   @[@(UMSocialPlatformType_WechatSession),
                                          @(UMSocialPlatformType_Sina),
                                          @(UMSocialPlatformType_QQ)
                    ];

     [UMSocialUIManager setPreDefinePlatforms:baseDisplaySnsPlatforms];
    
    
     //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        
        //创建网页内容对象
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:descr thumImage:[UIImage imageNamed:imagesStr]];
        
        //设置网页地址
        shareObject.webpageUrl= webpageUrl;//注意此处一定要有值，否则分享失败或无法打开qq
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject= shareObject;
        
        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
             
            NSLog(@"%@",data);
            
            if (error)
            {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
                NSString *errorMsg = error.userInfo[@"message"];
                [HUD showHUDError:nil title:errorMsg];
                
                BLOCK_EXEC(shareCompletionBlock,NO,platformType);
                
            }else{
                
                [HUD showHUDSuccess:nil title:@"分享成功"];
                BLOCK_EXEC(shareCompletionBlock,YES,platformType);
                
            }

         }];
                                             
       
    }];
                                    
}

@end
