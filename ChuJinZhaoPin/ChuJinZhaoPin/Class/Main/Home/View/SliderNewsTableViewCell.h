//
//  SliderNewsTableViewCell.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/1.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface SliderNewsTableViewCell : UITableViewCell 
@property (nonatomic, strong) NSArray *infoTextArr;
@property (nonatomic, strong) NSArray *bottomSignImageArr;
@property (nonatomic, strong) NSArray *bottomTitleArr;

@property (nonatomic, strong) NSArray *topSignImageArr;
@property (nonatomic, strong) NSArray *topTitleArr;

/**
 点击当前textView中的某行 index 索引
 */
@property (nonatomic, copy) void (^selectTextView)(NSInteger index);
@end

NS_ASSUME_NONNULL_END
