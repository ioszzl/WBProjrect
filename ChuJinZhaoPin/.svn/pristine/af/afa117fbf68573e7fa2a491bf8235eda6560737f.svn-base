//
//  YMRefreshFooter.m
//  Commect
//
//  Created by cassfile on 2017/6/19.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "YMRefreshFooter.h"

@implementation YMRefreshFooter


+ (id)ym_footerWithRefreshingsBlock:(footerBlock)footerBlock animated:(BOOL)animated{

    if (animated) {
        MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
              footerBlock();
        }];
        
        footer.stateLabel.font = [UIFont systemFontOfSize:12];
//        header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:12];        
//        [footer setImages:@[[UIImage imageNamed:@"voice1"]] duration:1 forState:MJRefreshStateIdle];
//        [footer setImages:@[[UIImage imageNamed:@"voice2"]] duration:1 forState:MJRefreshStatePulling];
//        [footer setImages:@[[UIImage imageNamed:@"voice1"],[UIImage imageNamed:@"voice2"],[UIImage imageNamed:@"voice3"]] duration:1 forState:MJRefreshStateRefreshing];
        footer.ignoredScrollViewContentInsetBottom = 5;
        return footer;
    }else{
        MJRefreshBackStateFooter *footer =[MJRefreshBackStateFooter footerWithRefreshingBlock:^{
            footerBlock();
        }];
          footer.stateLabel.font = [UIFont systemFontOfSize:12];
        return footer;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
