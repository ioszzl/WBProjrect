//
//  YMRefreshHeader.m
//  Commect
//
//  Created by cassfile on 2017/6/16.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "YMRefreshHeader.h"

@implementation YMRefreshHeader

+(id)ym_headerWithRefreshingsBlock:(headerBlock)headerBlock animated:(BOOL)animated{
    
    if (animated) {
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            headerBlock();
        }];
        
        header.stateLabel.textColor = [UIColor grayColor];
        header.lastUpdatedTimeLabel.textColor = [UIColor grayColor];
        header.stateLabel.font = [UIFont systemFontOfSize:12];
        header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:12];
        
//        [header setImages:@[[UIImage imageNamed:@"voice1"]] duration:1 forState:MJRefreshStateIdle];
//        [header setImages:@[[UIImage imageNamed:@"voice2"]] duration:1 forState:MJRefreshStatePulling];
//        [header setImages:@[[UIImage imageNamed:@"voice1"],[UIImage imageNamed:@"voice2"],[UIImage imageNamed:@"voice3"]] duration:1 forState:MJRefreshStateRefreshing];
        
        
        return header;
    }else{
       MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           headerBlock();
       }];
        header.stateLabel.textColor = [UIColor grayColor];
        header.stateLabel.font = [UIFont systemFontOfSize:12];
        header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:12];
        
        return header;
    }

}

@end
