//
//  CompanyScoreView.h
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CompanyScoreView : UIView
@property (nonatomic, strong) UIImageView *iconV;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *scoreLab;
@property (nonatomic, strong) UILabel *countLab;

@property (nonatomic, strong) NSString *score;

@property (nonatomic, strong) NSMutableArray<UIImageView *> *starImgArr;
@property (nonatomic, copy) void(^tapBlock)(void);
@end

NS_ASSUME_NONNULL_END
