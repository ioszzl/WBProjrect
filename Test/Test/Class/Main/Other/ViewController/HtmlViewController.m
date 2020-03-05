//
//  HtmlViewController.m
//  Test
//
//  Created by eims on 2018/12/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "HtmlViewController.h"
#import <WebKit/WebKit.h>
#import "WKWebView+JS.h"
#import "RHNetAPIManager.h"
@interface HtmlViewController ()
@property (nonatomic,strong)WKWebView *webView;
@end

@implementation HtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kNavBarHeight - kSecrityHeight)];
    if (self.htmlString ) {
        [self.webView loadHTMLString:self.htmlString baseURL:[NSURL URLWithString:BaseServerUrl]];
    }
    else {
        //NSString *url = @"http://map.baidu.com/?l=&s=nse%26wd%3D%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E5%AE%9D%E5%AE%89%E5%8C%BA%E8%A5%BF%E4%B9%A1%E8%A1%97%E9%81%93%E5%8A%9E%26isSingle%3Dtrue%26t%3D1%26name%3D%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E5%AE%9D%E5%AE%89%E5%8C%BA%E8%88%AA%E5%9F%8E%E5%A4%A7%E9%81%93%26ptx%3D12673897.33%26pty%3D2568364.16%26poiType%3D0%26sn%3D1%24%24%24%2412673897.33%2C2568364.16%24%24%E5%B9%BF%E4%B8%9C%E7%9C%81%E6%B7%B1%E5%9C%B3%E5%B8%82%E5%AE%9D%E5%AE%89%E5%8C%BA%E8%88%AA%E5%9F%8E%E5%A4%A7%E9%81%93%24%24%24%24%24%24%26sc%3D340%26ec%3D340";
        
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[self.urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]]]];
        
    }
    
    [self.view addSubview:self.webView];
    
//    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/2)];
//    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    //[self.view addSubview:web];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
