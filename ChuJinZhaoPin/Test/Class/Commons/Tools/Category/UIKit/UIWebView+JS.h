//
//  UIWebView+JS.h
//  汇银
//
//  Created by 李小斌 on 14-12-2.
//  Copyright (c) 2014年 7ien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (JS)

-(void) loadHTMLString:(NSString *)content;

-(void) loadHTMLString2:(NSString *)content andString:(NSString *) about;

-(void) loadHTMLStringWhitoutWrap:(NSString *)content;

//于向前添加自适应新方法
-(void) loadHTMLStringWriteByYXQ:(NSString *)content;

-(void)handHTMLStrings:(NSString *)htmlString;
@end
