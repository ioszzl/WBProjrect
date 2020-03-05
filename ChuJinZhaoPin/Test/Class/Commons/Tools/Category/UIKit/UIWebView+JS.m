//
//  UIWebView+JS.m
//  汇银
//
//  Created by 李小斌 on 14-12-2.
//  Copyright (c) 2014年 7ien. All rights reserved.
//

#import "UIWebView+JS.h"

#import "NSString+Extension.h"

@implementation UIWebView (JS)

-(void) loadHTMLString:(NSString *)content
{
    NSString *strValue =  [NSString ym_stringUtils:content];
    
    strValue = [strValue stringByReplacingOccurrencesOfString: @"\n" withString:@"<br/>"];
    strValue = [self replaceStr:@"[w][i][d][t][h][:](\\d+\\.?\\d+)[p][t][;]" withReplacedStr:strValue withPlaceStr:@""];
    strValue = [self replaceStr:@"(font-size: )(\\d+px)" withReplacedStr:strValue withPlaceStr:@"$114pt"];
    
    strValue = [self replaceStr:@"emoticons" withReplacedStr:strValue withPlaceStr:@"gif"];
    
    NSMutableString *data_content = [NSMutableString stringWithString:@""];
    [data_content appendString:@"<!DOCTYPE html>"];
    [data_content appendString:@"<html>"];
    [data_content appendString:@"<head>"];
    [data_content appendString:@"<meta charset=\"utf-8\">"];
    [data_content appendString:@"<meta id=\"viewport\" name=\"viewport\" content=\"width=device-width,initial-scale=1.0, minimum-scale=0.1, maximum-scale=2.0,user-scalable=yes\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />"];
    [data_content appendString:@"<meta name=\"black\" name=\"apple-mobile-web-app-status-bar-style\" />"];
    [data_content appendString:@"<style>table{width:100%;}</style>"];
    [data_content appendString:@"<title>webview</title>"];
    [data_content appendString:[NSString stringWithFormat:@"<base href=\"%@\" />", AppDelegateInstance.baseImageUrl]];
    [data_content appendString:@"</head>"];
    [data_content appendString:@"<body>"];
    
    [data_content appendString:@"<div style=\"line-height:1.5em;color:#797992;;padding:0 0 0 0\">"];
    
    [data_content appendString:strValue];
    
    [data_content appendString:@"</div>"];
    
    [data_content appendString:@"<script type=\"text/javascript\">"];
    [data_content appendString:@"var imgArray = document.getElementsByTagName(\"img\");"];
    [data_content appendString:@"var length = imgArray.length;"];
    [data_content appendString:@"var s = \"\";"];
    [data_content appendString:@"for(var i = 0; i < length; i++){"];
    [data_content appendString:@"$img[i].style.width = '100%%';\n"];
    [data_content appendString:@"$img[i].style.height ='auto'\n"];
    [data_content appendString:@"var srcUrl = img.src;"];
    [data_content appendString:@"var srcUrl = document.getElementsByTagName(\"img\");"];
    [data_content appendString:@"if(srcUrl.indexOf('common/kindeditor/plugins/emoticons') > 0){"];
    // 如果是表情图片
    [data_content appendString:@"}else{"];
    // 表示不是表情图片.
    [data_content appendString:@"img.style.width = \"100%\";"];
    [data_content appendString:@"img.style.height = \"auto\";"];
    
    [data_content appendString:@"}"];
    [data_content appendString:@"}"];
    [data_content appendString:@"</script>"];
    [data_content appendString:@"</body>"];
    [data_content appendString:@"</html>"];
    
    [self loadHTMLString:data_content baseURL:nil];
}

// 不带换行处理的方法
-(void) loadHTMLString:(NSString *)title withContent:(NSString *)content{
    
    NSString *strValue =  [NSString ym_stringUtils:content];
    
    strValue = [strValue stringByReplacingOccurrencesOfString: @"\n" withString:@"<br/>"];
    strValue = [self replaceStr:@"[w][i][d][t][h][:](\\d+\\.?\\d+)[p][t][;]" withReplacedStr:strValue withPlaceStr:@""];
    
    NSMutableString *data_content = [NSMutableString stringWithString:@""];
    [data_content appendString:@"<!DOCTYPE html>"];
    [data_content appendString:@"<html>"];
    [data_content appendString:@"<head>"];
    [data_content appendString:@"<meta charset=\"utf-8\">"];
    [data_content appendString:@"<meta id=\"viewport\" name=\"viewport\" content=\"width=device-width,initial-scale=1.0, minimum-scale=0.1, maximum-scale=2.0,user-scalable=yes\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />"];
    [data_content appendString:@"<meta name=\"black\" name=\"apple-mobile-web-app-status-bar-style\" />"];
    //    [data_content appendString:@"<style>img{width:100%;}</style>"];
    [data_content appendString:@"<style>table{width:100%;}</style>"];
    [data_content appendString:@"<title>webview</title>"];
    [data_content appendString:[NSString stringWithFormat:@"<base href=\"%@\" />", AppDelegateInstance.baseImageUrl]];
    [data_content appendString:@"</head>"];
    [data_content appendString:@"<body>"];
    
    [data_content appendString:@"<h5 style=\"text-align:center;color:#333333;font-size:16px;\">"];
    [data_content appendString:title];
    [data_content appendString:@"</h5>"];
    
    [data_content appendString:@"<div style=\"line-height:1.5em;color:#404040;padding:0 0 0 0\">"];
    
    [data_content appendString:strValue];
    
    [data_content appendString:@"</div>"];
    
    [data_content appendString:@"<script type=\"text/javascript\">"];
    [data_content appendString:@"var imgArray = document.getElementsByTagName(\"img\");"];
    [data_content appendString:@"var length = imgArray.length;"];
    [data_content appendString:@"var s = \"\";"];
    [data_content appendString:@"for(var i = 0; i < length; i++){"];
    [data_content appendString:@"var img = imgArray[i];"];
    [data_content appendString:@"var srcUrl = img.src;"];
    [data_content appendString:@"if(srcUrl.indexOf('common/kindeditor/plugins/emoticons') > 0){"];
    // 如果是表情图片
    [data_content appendString:@"}else{"];
    // 表示不是表情图片.
    [data_content appendString:@"img.style.width = \"100%\";"];
    [data_content appendString:@"img.style.height = \"auto\";"];
    
    [data_content appendString:@"}"];
    [data_content appendString:@"}"];
    [data_content appendString:@"</script>"];
    
    [data_content appendString:@"</body>"];
    [data_content appendString:@"</html>"];
    
    [self loadHTMLString:data_content baseURL:nil];
}


-(void) loadHTMLStringWhitoutWrap:(NSString *)content
{
    NSString *strValue =  [NSString ym_stringUtils:content];
    strValue = [self replaceStr:@"[w][i][d][t][h][:](\\d+\\.?\\d+)[p][t][;]" withReplacedStr:strValue withPlaceStr:@""];
    
    NSMutableString *data_content = [NSMutableString stringWithString:@""];
    [data_content appendString:@"<!DOCTYPE html>"];
    [data_content appendString:@"<html>"];
    [data_content appendString:@"<head>"];
    [data_content appendString:@"<meta charset=\"utf-8\">"];
    [data_content appendString:@"<meta id=\"viewport\" name=\"viewport\" content=\"width=device-width,initial-scale=1.0, minimum-scale=0.1, maximum-scale=2.0,user-scalable=yes\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />"];
    [data_content appendString:@"<meta name=\"black\" name=\"apple-mobile-web-app-status-bar-style\" />"];
    //    [data_content appendString:@"<style>img{width:100%;}</style>"];
    [data_content appendString:@"<style>table{width:100%;}</style>"];
    [data_content appendString:@"<title>webview</title>"];
    [data_content appendString:[NSString stringWithFormat:@"<base href=\"%@\" />", AppDelegateInstance.baseImageUrl]];
    [data_content appendString:@"</head>"];
    [data_content appendString:@"<body>"];
    
    [data_content appendString:@"<div style=\"line-height:1.5em;color:#404040;padding:0 0 0 0\">"];
    
    [data_content appendString:strValue];
    
    [data_content appendString:@"</div>"];
    
    [data_content appendString:@"<script type=\"text/javascript\">"];
    [data_content appendString:@"var imgArray = document.getElementsByTagName(\"img\");"];
    [data_content appendString:@"var length = imgArray.length;"];
    [data_content appendString:@"var s = \"\";"];
    [data_content appendString:@"for(var i = 0; i < length; i++){"];
    [data_content appendString:@"var img = imgArray[i];"];
    [data_content appendString:@"var srcUrl = img.src;"];
    [data_content appendString:@"if(srcUrl.indexOf('common/kindeditor/plugins/emoticons') > 0){"];
    // 如果是表情图片
    [data_content appendString:@"}else{"];
    // 表示不是表情图片.
    [data_content appendString:@"img.style.width = \"100%\";"];
    [data_content appendString:@"img.style.height = \"auto\";"];
    
    [data_content appendString:@"}"];
    [data_content appendString:@"}"];
    [data_content appendString:@"</script>"];
    
    [data_content appendString:@"</body>"];
    [data_content appendString:@"</html>"];
    
    [self loadHTMLString:data_content baseURL:nil];
}


-(NSString*)replaceStr:(NSString*)regexPattern withReplacedStr:(NSString*)str withPlaceStr:(NSString*)pstr{
    NSMutableString *value = [[NSMutableString alloc] initWithString:str];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexPattern options:0 error:nil];
    [regex replaceMatchesInString:value options:0 range:NSMakeRange(0, [str length]) withTemplate:pstr];
    return value;
}

- (NSString *)replaceTableHtml:(NSString *)oldHtml {
    NSString *regex = @"[w][i][d][t][h][:](\\d+\\.?\\d+)[p][t][;]";
    NSRange r;
    NSMutableString *newHtml = [NSMutableString stringWithString:oldHtml];
    BOOL flag = false;
    while (flag == false) {
        r = [newHtml rangeOfString:regex options:NSRegularExpressionSearch];
        if (r.location != NSNotFound) {
            [newHtml replaceCharactersInRange:r withString:@""];
        } else {
            flag = true;
        }
    };
    return newHtml;
}


-(void) loadHTMLString2:(NSString *)content andString:(NSString *) about
{
    NSString *strValue =  [NSString ym_stringUtils:content];
    
    strValue = [strValue stringByReplacingOccurrencesOfString: @"\n" withString:@"<br/>"];
    
    about = [about stringByReplacingOccurrencesOfString: @"\n" withString:@"<br/>"];
    
    NSMutableString *data_content = [NSMutableString stringWithString:@""];
    [data_content appendString:@"<!DOCTYPE html>"];
    [data_content appendString:@"<html>"];
    [data_content appendString:@"<head>"];
    [data_content appendString:@"<meta charset=\"utf-8\">"];
    [data_content appendString:@"<meta id=\"viewport\" name=\"viewport\" content=\"width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=false\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />"];
    [data_content appendString:@"<meta name=\"black\" name=\"apple-mobile-web-app-status-bar-style\" />"];
    [data_content appendString:@"<style>img{width:100%;}</style>"];
    [data_content appendString:@"<style>table{width:100%;}</style>"];
    [data_content appendString:@"<title>webview</title>"];
    [data_content appendString:[NSString stringWithFormat:@"<base href=\"%@\" />", AppDelegateInstance.baseImageUrl]];
    [data_content appendString:@"</head>"];
    [data_content appendString:@"<body>"];
    [data_content appendString:@"<div style=\"line-height:1.5em;color:#707070;padding:0 0 0 0\">"];
    [data_content appendString:strValue];
    [data_content appendString:@"</div>"];
    [data_content appendString:@"<div style=\"line-height:1.5em;color:#707070;padding:0 0 0 0\">"];
    [data_content appendString:about];
    [data_content appendString:@"</div>"];
    [data_content appendString:@"</body>"];
    [data_content appendString:@"</html>"];
    
    [self loadHTMLString:data_content baseURL:nil];
}

-(void) loadHTMLStringWriteByYXQ:(NSString *)content{
    
    NSMutableString *data_content = [NSMutableString stringWithString:@""];
    [data_content appendString:@"<!DOCTYPE html>"];
    [data_content appendString:@"<html>"];
    [data_content appendString:@"<head>"];
    [data_content appendString:@"<meta charset=\"utf-8\">"];
    [data_content appendString:@"<meta id=\"viewport\" name=\"viewport\" content=\"width=device-width,height=device-height,user-scalable=no\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />"];
    [data_content appendString:@"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />"];
    [data_content appendString:@"<meta name=\"black\" name=\"apple-mobile-web-app-status-bar-style\" />"];
    [data_content appendString:@"<style>img{max-width:100%;height:auto}</style>"];
    [data_content appendString:@"<style>table{width:100%;}</style>"];
    [data_content appendString:@"<title>webview</title>"];
    [data_content appendString:[NSString stringWithFormat:@"<base href=\"%@\"/>",AppDelegateInstance.baseImageUrl]];
    [data_content appendString:@"</head>"];
    [data_content appendString:@"<body>"];
    [data_content appendString:@"<div style=\"line-height:1.5em;color:#707070;padding:0 0 10px 0\">"];
    [data_content appendString:content];
    [data_content appendString:@"</div>"];
    [data_content appendString:@"</body>"];
    [data_content appendString:@"</html>"];

    [self loadHTMLString:data_content baseURL:nil];

    
}

-(void)handHTMLStrings:(NSString *)htmlString{
    
    NSString *htmlStrings = [NSString stringWithFormat:@"<html> \n"
                            "<head> \n"
                            "<style type=\"text/css\"> \n"
                            "body {font-size:15px;}\n"
                            "</style> \n"
                            "</head> \n"
                            "<body>"
                            "<script type='text/javascript'>"
                            "window.onload = function(){\n"
                            "document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '300%%'\n"
                            "var $img = document.getElementsByTagName('img');\n"
                            "for(var p in  $img){\n"
                            " $img[p].style.width = '100%%';\n"
                            "$img[p].style.height ='auto'\n"
                            "}\n"
                            "}"
                            "</script>%@"
                            "</body>"
                            "</html>",htmlString];
    [self loadHTMLString:htmlStrings baseURL:nil];
}



@end
