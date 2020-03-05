//
//  RHNetAPIManager.h
//  JieBao
//
//  Created by 孙若淮 on 24/10/2017.
//  Copyright © 2017 Monster. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  网络请求工具类
 */
@class RHNetAPIManager;

/**定义请求类型的枚举*/

typedef NS_ENUM(NSUInteger,HttpRequestType)
{
    
    HttpRequestTypeGet = 0,
    HttpRequestTypePost
    
};


typedef void (^LTNetCompletion)(id data, NSString * msg , NSInteger code ,NSError* error);
typedef void (^RHRequestStart)(LTNetCompletion completeHandler);
typedef RHNetAPIManager * (^RHRequestFailure)(void);
typedef RHNetAPIManager * (^RHRequestHiddenLoading)(void);
typedef RHNetAPIManager * (^RHRequestChangeBaseURL)(void);

/*!
 *  管理请求任务。执行取消，暂停，继续等任务.
 *  - (void)cancel，取消任务
 *  - (void)suspend，暂停任务
 *  - (void)resume，继续任务
 */
typedef NSURLSessionTask URLSessionTask;


@interface RHNetAPIManager : NSObject

+ (instancetype)sharedManager;

/**
 发起请求
 */
@property (nonatomic,copy,readonly)RHRequestStart start;

/**
 请求失败不返回
 */
@property (nonatomic,copy,readonly)RHRequestFailure hiddenFailure;

/**
 隐藏加载提示
 */
@property (nonatomic,copy,readonly)RHRequestHiddenLoading hiddenLoading;



/**
 请求参数
 */
@property (nonatomic,strong)NSMutableDictionary *params;

/**
 请求相对路径
 */
@property (nonatomic,copy)NSString *aPath;



@end
