//
//  WKWebView+JS.h
//  yidianjiankang
//
//  Created by eims on 17/3/31.
//  Copyright © 2017年 eims. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebView (JS)
-(void) loadHTMLString:(NSString *_Nullable)content;

/**处理html 内容，图片全屏显示，字体大小控制*/
-(void)handleHTMLString:(NSString *_Nullable)content baseURL:(nullable NSURL *)baseURL;

@end
