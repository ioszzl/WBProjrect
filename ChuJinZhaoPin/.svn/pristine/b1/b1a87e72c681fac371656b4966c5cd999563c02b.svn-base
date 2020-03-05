//
//  JobCommentTableViewCell.h
//  ChuJinZhaoPin
//
//  Created by zzl on 2018/11/4.
//  Copyright © 2018 Monster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobDetailModel.h"
#import "CommentDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CommentDetailType) {
    commentDetailTypeHome = 0,
    commentDetailTypeComment
};

@interface JobCommentTableViewCell : UITableViewCell

@property (nonatomic, assign) CommentDetailType commentType;

@property (nonatomic, strong) UIImageView *headImgV;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *jobLab;
@property (nonatomic, strong) UILabel *commentLab;
@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UILabel *scoreLab;
@property (nonatomic, strong) UIButton *likeBtn;

@property (nonatomic, strong) NSString  *score;
@property (nonatomic, strong) NSMutableArray<UIImageView *> *starImgArr;
@property (nonatomic, strong) NSMutableArray<UILabel *> *tagLabArr;
@property (nonatomic, strong) NSArray *markArr;



@property (nonatomic, strong) UIView *line;

@property (nonatomic, strong) JobDetailComment *model;
@property (nonatomic, strong) CommentDetailList *list;

@property (nonatomic, copy) void(^likeBtnBlock)(UIButton *btn);
@end

NS_ASSUME_NONNULL_END
