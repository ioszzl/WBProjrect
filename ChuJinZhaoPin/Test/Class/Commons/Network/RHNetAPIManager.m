//
//  RHNetAPIManager.m
//  JieBao
//
//  Created by 孙若淮 on 24/10/2017.
//  Copyright © 2017 Monster. All rights reserved.
//

#import "RHNetAPIManager.h"

#import "BaseModel.h"
#import "AFNetworking.h"
#import "NetWorkConfig.h"
#import "MJExtension.h"
#import "NSString+Extension.h"
#import "ShoveGeneralRestGateway.h"
#import "HUD.h"
#import "NSDate+Utilities.h"
static NSMutableArray<URLSessionTask*> *urlTasks;

@interface RHNetAPIManager()
/**
 失败是否返回
 */
@property (nonatomic,assign)BOOL failureBlock;

/**
 是否显示加载框
 */
@property (nonatomic,assign)BOOL LoadingShow;

/**
 请求方式
 */
@property (nonatomic,assign) HttpRequestType type;



@end

@implementation RHNetAPIManager

+ (instancetype)sharedManager {
    
    static RHNetAPIManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
        shared_manager.type = HttpRequestTypePost;
        shared_manager.aPath = @"";
    });
    [shared_manager.params removeAllObjects];
    shared_manager.failureBlock = YES;
    shared_manager.LoadingShow = YES;
    
    
    return shared_manager;
}

-(RHRequestHiddenLoading)hiddenLoading{
    return ^(){
        self.LoadingShow = NO;
        return self;
    };
}

-(RHRequestFailure)hiddenFailure {
    return ^(){
        self.failureBlock = NO;
        return self;
    };
}

-(RHRequestStart)start{
    return ^(LTNetCompletion completeHandler){
        [self requestJsonDataBlock:completeHandler];
    };
}

//-(RHRequestChangeBaseURL)changeParkURL {
//    return ^() {
//        NSURL * url = [NSURL URLWithString:BaseServerParkUrl];
//        [[RHNetAPIManager sharedHTTPSessionManager] setValue:url forKey:@"baseURL"];
//        self.urlType = 1;
//        return self;
//    };
//}

//-(RHRequestChangeBaseURL)changePlatformURL {
//    return ^() {
//        NSURL * url = [NSURL URLWithString:BaseServerPlatformUrl];
//        [[RHNetAPIManager sharedHTTPSessionManager] setValue:url forKey:@"baseURL"];
//        self.urlType = 0;
//        return self;
//
//    };
//}

-(NSMutableDictionary *)params{
    if (!_params) {
        _params = [NSMutableDictionary dictionary];
    }
    return _params;
}

+ (AFHTTPSessionManager *)sharedHTTPSessionManager{

    static AFHTTPSessionManager * manager = nil;
    
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:BaseServerUrl]];

        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        // 设置超时时间
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = 60.f;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/html", @"text/javascript", @"text/json", @"text/x-json",@"image/jpeg",nil];

        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];


    });
    return manager;
}
#pragma mark -session delegate

+ (NSMutableArray<URLSessionTask*> *)urlTasks {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        urlTasks = [[NSMutableArray alloc] init];
    });
    return urlTasks;
}
-(void)requestJsonDataBlock:(void (^)(id,NSString *,NSInteger ,  NSError *))block{
    
    URLSessionTask *sessionTask = nil;
    if ([RHNetAPIManager urlTasks].count == 0 && self.LoadingShow) {
        [HUD showHUDWithImageArr:nil andShowView:nil];
    }
    
    if (!AppDelegateInstance.netWorkState) {
        if ([RHNetAPIManager urlTasks].count) {
            [[RHNetAPIManager urlTasks] removeAllObjects];
        }
        [HUD dissmissShowView:nil];
        [HUD showHUDError:nil title:@"网络不可用"];
        return;
    }

    
    NSMutableString *urlString = [NSMutableString string];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:self.params];
    
    if ([self.aPath containsString:@"mobileImageUpload.do"]) {
        
    }
//    else {
//        NSString *mKey = [ShoveGeneralRestGateway getSignData:param];
//        [param setValue:mKey forKey:@"mKey"];
//
//    }
    
    //请求加密
//    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//    [param setValue:uuid forKey:@"deviceId"];  //设备ID
//    [param setValue:@"2" forKey:@"equipmentType"];
    
    /**新验签方法*/
//    [param setValue:Public_KEY forKey:@"appkey"];
//    [param setValue:[NSDate dateTodayString:@"yyyyMMddHHmmss"] forKey:@"qTime"];
//    NSString *mKey = [ShoveGeneralRestGateway getNewSignData:param];
//    [param setValue:mKey forKey:@"sign"];

    

    
    if ([param allKeys].count == 0) {
       
        [urlString appendFormat:@"%@%@",BaseServerUrl,self.aPath];
        
    }
    else{
        for (int i = 0; i<[param allKeys].count; i++) {
            NSString *value = [param objectForKey:[[param allKeys]objectAtIndex:i]];
            if (i == 0) {
                
                [urlString appendFormat:@"%@%@?%@=%@",BaseServerUrl,self.aPath,[[param allKeys] firstObject],value];
                
            }
            else{
                [urlString appendFormat:@"&%@=%@",[[param allKeys] objectAtIndex:i],value];
            }
        }
    }
    
    
    
    //打印请求地址与参数
    //if ([self.params[@"data"] length] < 255 ) {
        NSLog(@"******************** 请求参数 ***************************");
        NSLog(@"请求头: %@\n请求方式: %@\n请求URL: %@\n请求param: %@\n\n",[RHNetAPIManager sharedHTTPSessionManager].requestSerializer.HTTPRequestHeaders, (self.type == HttpRequestTypeGet) ? @"GET":@"POST",urlString, param);
    //}
    
    switch (self.type) {
        case HttpRequestTypePost:
        {            
            sessionTask = [[RHNetAPIManager sharedHTTPSessionManager] POST:self.aPath parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"******************** 返回参数 ***************************");
                
                
                if (!responseObject) {
                    [HUD dissmissShowView:nil];
                    
                    block(nil,@"数据异常",-1,nil);
                }
                else {
                    NSLog(@"%@",[NSString ym_jsonStringWithDictionary:responseObject]);
                    
                    BaseModel *baseModel = [BaseModel mj_objectWithKeyValues:responseObject];
                    if (baseModel.code == 0) {
                        int i = 0;
                        for (URLSessionTask *sessionTask in [RHNetAPIManager urlTasks]) {
                            if (sessionTask.state != NSURLSessionTaskStateCompleted) {
                                break;
                            }
                            i++;
                        }
                        if (i == [RHNetAPIManager urlTasks].count) {
                            [[RHNetAPIManager urlTasks]removeAllObjects];
                            [HUD dissmissShowView:nil];
                            
                        }
                        block(responseObject,baseModel.msg,baseModel.code,nil);
                    }else if (baseModel.code == 1111 ||
                              baseModel.code == 1112 ||
                              baseModel.code == 1113 ||
                              baseModel.code == 1114 ||
                              baseModel.code == 1115 ||
                              baseModel.code == 1116){//1111为未通过企业认证,1112企业认证正在进行审核,1113企业认证未通过审核,1114企业认证已通过,但企业信息未完善,1115企业认证通过,但企业信息审核中,1116企业认证通过,但企业信息审核不通过
                        
                        [HUD dissmissShowView:nil];
                        AppDelegateInstance.userModel.loginCode = baseModel.code;
                        DefaultsSetObject([AppDelegateInstance.userModel mj_JSONString], KEY_USER_DATA);
                        block(responseObject,baseModel.msg,baseModel.code,nil);
                        [HUD showHUDError:nil title:baseModel.msg];
                        
                    }else if (baseModel.code == 1117){//黑名单拦截:若求职者/企业被平台加入黑名单,只能访问个人中心/企业中心的接口和H5,访问其他模块的接口会被拦截,返回如下信息
                        [HUD dissmissShowView:nil];
                        block(responseObject,baseModel.msg,baseModel.code,nil);
                        [HUD showHUDError:nil title:baseModel.msg];
                        
                    }else if (baseModel.code == 5000){//平台入驻押金不足,无法邀请投递
                        
                        [HUD dissmissShowView:nil];
                        block(responseObject,baseModel.msg,baseModel.code,nil);
                        
                    }else if (baseModel.code == 8888){//账号未绑定,跳转登录页绑定
                        
                        [HUD dissmissShowView:nil];
                        block(nil,baseModel.msg,baseModel.code,nil);
                        
                    }else if (baseModel.code == 9999) {//token不存在或已失效
                        [HUD dissmissShowView:nil];
                        [[NSNotificationCenter defaultCenter]postNotificationName:@"token无效" object:nil];
                        [HUD showHUDError:nil title:@"登录已过期，请重新登录"];
                    }
                    else{
                        [HUD dissmissShowView:nil];
                        
                        if (self.failureBlock) {
                            [HUD showHUDError:nil title:baseModel.msg];
                            
                        }else{
                            
                        }
                        
                        
                        
                        block(nil,baseModel.msg,baseModel.code,nil);
                    }
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                [HUD dissmissShowView:nil];
                
                [[RHNetAPIManager urlTasks] removeObject:task];
                
                if (error.code == -1001) {
                    [HUD showHUDError:nil title:@"网络异常"];
                    NSLog(@"请求超时啦！！！");
                }
                
                else{
                    NSLog(@"%@",[error debugDescription]);
                }
                if (self.failureBlock) {
                    block(nil,@"连接服务器失败",-1,error);
                }
                
                
            }];
        }
            break;
        default:
            break;
    }
    if (sessionTask) {
        [[RHNetAPIManager urlTasks] addObject:sessionTask];
        
    }
    
}
/**
 *  取消所有的网络请求
 */

- (void)cancelAllRequest {
    for (URLSessionTask *sessionTask in [RHNetAPIManager urlTasks]) {
        [sessionTask cancel];
    }
}

@end
