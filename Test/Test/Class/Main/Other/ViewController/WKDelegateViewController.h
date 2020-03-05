//
//  WKDelegateViewController.h
//  MaShangYin
//
//  Created by eims on 2018/5/15.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@protocol WKDelegate <NSObject>

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;

@end

@interface WKDelegateViewController : UIViewController <WKScriptMessageHandler>
@property (weak , nonatomic) id<WKDelegate> delegate;
@end
