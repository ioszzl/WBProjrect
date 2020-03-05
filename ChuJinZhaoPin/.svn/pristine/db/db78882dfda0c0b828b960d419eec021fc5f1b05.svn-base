//
//  YMTablePlaceholderView.m
//  Test
//
//  Created by eims on 17/6/20.
//  Copyright © 2017年 eims. All rights reserved.
//

#import "YMTablePlaceholderView.h"
#import "UIView+Category.h"
@implementation YMTablePlaceholderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 10, 30, 30)];
        _imageView.centerX = self.centerX-30;
        _imageView.backgroundColor = [UIColor redColor];
        [self addSubview:_imageView];
        
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(_imageView.right+10, _imageView.top, 100, 30)];
        _label.font =[UIFont systemFontOfSize:14.0f];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
    }
    return self;
}


@end

@implementation UITableView (EmptyPlaceholder)

- (void)ym_checkEmptyWithType:(YMTablePlaceholderViewType)type message:(NSString *)message {
    
    YMTablePlaceholderView *placeholder = [[YMTablePlaceholderView alloc] initWithFrame:CGRectMake(0, 0, self.width, 50)];
    switch (type) {
        case YMTablePlaceholderViewTypeEmpty:
            placeholder.imageView.image = [UIImage imageNamed:@"yf_empty_page"];
            if (!message.length) {
                message = @"没有内容";
            }
            break;
        case YMTablePlaceholderViewTypeError:
        default:
            placeholder.imageView.image = [UIImage imageNamed:@"yf_error"];
            if (!message.length) {
                message = @"出错了";
            }
            break;
    }
    
    placeholder.label.text = message;
    self.tableHeaderView = placeholder;
}

- (void)ym_removeEmptyView {
    
    self.tableHeaderView = [[UIView alloc] init];
}
@end
