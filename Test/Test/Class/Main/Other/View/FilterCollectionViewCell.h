//
//  FilterCollectionViewCell.h
//  Test
//
//  Created by eims on 2018/11/15.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilterCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, copy) NSString *text;
@end

NS_ASSUME_NONNULL_END
