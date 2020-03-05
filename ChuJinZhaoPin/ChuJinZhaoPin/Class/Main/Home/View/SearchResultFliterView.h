//
//  SearchResultFliterView.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/2.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultFliterView : UIView
@property (nonatomic, strong) NSArray *tradeArr;
@property (nonatomic, strong) NSArray *cityArr;

@property (nonatomic, assign) NSInteger selectEduIndex;
@property (nonatomic, assign) NSInteger selectYearIndex;
@property (nonatomic, assign) NSInteger selectPayIndex;



@property (nonatomic, copy) void(^educationBtnBlock)(UIButton *btn, NSInteger eduID);
@property (nonatomic, copy) void(^yearBtnBlock)(UIButton *btn, NSInteger yearID);
@property (nonatomic, copy) void(^payBtnBlock)(UIButton *btn, NSInteger payID);
@property (nonatomic, copy) void(^tradeBtnBlock)(UIButton *btn);
@property (nonatomic, copy) void(^cityBtnBlock)(UIButton *btn);

@property (nonatomic, copy) void(^itemBtnBlock)(UIButton *btn);
@end

NS_ASSUME_NONNULL_END
