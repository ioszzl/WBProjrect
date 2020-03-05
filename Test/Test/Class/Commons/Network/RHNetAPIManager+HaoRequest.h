//
//  RHNetAPIManager+HaoRequest.h
//  Test
//
//  Created by zhaohaohao on 2018/12/4.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import "RHNetAPIManager.h"

@interface RHNetAPIManager (HaoRequest)

/**
 第三方登录

 @param params <#params description#>
 @return <#return value description#>
 */
-(RHNetAPIManager*)appThirdLoginWithOPT:(NSMutableDictionary *)params;
@end
