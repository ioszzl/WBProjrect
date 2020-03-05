//
//  YMRefreshFooter.h
//  Commect
//
//  Created by cassfile on 2017/6/19.
//  Copyright © 2017年 eims. All rights reserved.

//使用方法
//self.tableView.mj_footer =[YMRefreshFooter ym_footerWithRefreshingsBlock:^{
//    
//    sleep(1);
//    [self.tableView.mj_footer endRefreshing];
//} animated:YES];
#import <MJRefresh/MJRefresh.h>

typedef void(^footerBlock)();
                             
@interface YMRefreshFooter : MJRefreshAutoFooter


/**
 加载下拉刷新控件

 @param footerBlock <#footerBlock description#>
 @param animated 是否选中有动画的加载
 @return <#return value description#>
 */
+(id)ym_footerWithRefreshingsBlock:(footerBlock)footerBlock animated:(BOOL)animated;

@end
