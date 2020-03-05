//
//  ConpanyPictureView.m
//  Test
//
//  Created by zzl on 2018/11/4.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "ConpanyPictureView.h"
#import "XLPhotoBrowser.h"
@implementation ConpanyPictureView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)initUI{
    UIView *bgV = [UIView new];
    bgV.backgroundColor = RGBCOLOR(255, 255, 255);
    [self addSubview:bgV];
    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    NSArray *arr = @[@"前台",@"办公区",@"会议室",@"休息区",@"奖章"];
    UIButton *tempBtn;
    for (int i = 0; i < arr.count; i++) {
        UIButton *btn = [UIButton ym_ButtonWithFrame:CGRectZero title:arr[i] backgroundColor:nil titleColor:COLOR_RGB_51 titleSize:Size(14)];
        btn.layer.cornerRadius = Size(5);
        btn.clipsToBounds = YES;
        btn.tag = i;
        [bgV addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!tempBtn) {
                make.top.mas_offset(Size(20));
            }else{
                make.top.equalTo(tempBtn.mas_bottom).mas_offset(Size(9));
            }
            make.left.mas_offset(Size(15));
            make.width.mas_equalTo(Size(132/2));
            make.height.mas_offset(Size(55/2));
        }];
        [btn  setBackgroundImage:[UIImage ym_imageWithColor:RGBCOLOR(254, 207, 35) size:CGSizeMake(Size(132/2), Size(55/2))] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(doBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        tempBtn = btn;
        [self.btnArr addObject:btn];
    }
    
    UIImageView *imgV = [UIImageView  new];
    imgV.layer.cornerRadius = Size(5);
    imgV.clipsToBounds = YES;
    imgV.contentMode = UIViewContentModeScaleAspectFit;
    [bgV addSubview:imgV];
    self.imgV = imgV;
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(182/2));
        make.top.mas_offset(Size(20));
        make.right.bottom.mas_offset(-Size(15));
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapImg:)];
    imgV.userInteractionEnabled = YES;
    [imgV addGestureRecognizer:tap];
    
    
    [self doBtn:self.btnArr[0]];
}

-(void)doBtn:(UIButton *)btn{
    BLOCK_EXEC(self.btnBlock,btn);
}


-(void)doTapImg:(UITapGestureRecognizer *)tap{
    UIImageView *clickedImageView = (UIImageView *)tap.view;
    if (!clickedImageView.image) {
        //NSLog(@"空了空了空");
        return;
    }
    
    XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithImages:@[clickedImageView.image] currentImageIndex:0];
    browser.sourceImageView = clickedImageView;
    browser.browserStyle = XLPhotoBrowserStyleIndexLabel; // 微博样式
//    [XWScanImage scanBigImageWithImageView:clickedImageView];
}

- (NSMutableArray<UIButton *> *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
