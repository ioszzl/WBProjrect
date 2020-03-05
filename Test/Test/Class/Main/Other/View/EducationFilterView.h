//
//  EducationFilterView.h
//  Test
//
//  Created by eims on 2018/11/15.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 学历筛选
 */
@interface EducationFilterView : UIView
@property (nonatomic, strong) NSArray<NSIndexPath *> *itemArr;
@property (nonatomic, copy) void(^selectedItemBlock)(NSIndexPath *indexPath);

@property (nonatomic, strong) NSArray *defautArr;

@property (nonatomic, copy) void(^sureBtnBlock)(NSString *eduStr, NSString *workStr, NSString *salaStr, NSInteger eduID, NSInteger workID, NSInteger salaID);
@end

NS_ASSUME_NONNULL_END
