//
//  YMRefreshHeader.h
//  Commect
//
//  Created by cassfile on 2017/6/16.
//  Copyright © 2017年 eims. All rights reserved.

//使用方法在控制价写
//self.tableView.mj_header=[YMRefreshHeader ym_headerWithRefreshingsBlock:^{
//
//    sleep(1);
//    [self.tableView.mj_header endRefreshing];
//} animated:YES];


#import <MJRefresh/MJRefresh.h>

typedef void(^headerBlock)(void);

@interface YMRefreshHeader : MJRefreshNormalHeader
/**
 加载上拉刷新控件

 @param headerBlock <#headerBlock description#>
 @param animated 是否选中有动画的加载
 @return <#return value description#>
 */
+(id)ym_headerWithRefreshingsBlock:(headerBlock)headerBlock animated:(BOOL)animated;

@end
