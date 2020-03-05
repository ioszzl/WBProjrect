//
//  JobCommentTableViewCell.m
//  Test
//
//  Created by zzl on 2018/11/4.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "JobCommentTableViewCell.h"

@implementation JobCommentTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return  self;
}
-(void)initUI{
    _headImgV = [UIImageView new];
    _headImgV.layer.cornerRadius = Size(20);
    _headImgV.clipsToBounds = YES;
    //_headImgV.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_headImgV];
    [_headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(Size(40));
        make.left.top.mas_offset(Size(15));
    }];
    
    _nameLab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_15 textColor:COLOR_RGB_153];
    [self.contentView addSubview:_nameLab];
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImgV.mas_right).mas_offset(Size(12));
        make.top.mas_offset(Size(15));
    }];
    
    
    _scoreLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(11)] textColor:COLOR_RGB_153];
    [self.contentView addSubview:_scoreLab];
    [_scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(15));
        make.top.mas_offset(Size(15));
    }];
    
    
    _jobLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(14)] textColor:COLOR_RGB_51];
    [self.contentView addSubview:_jobLab];
    [_jobLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLab);
        make.top.equalTo(_nameLab.mas_bottom).mas_offset(Size(10));
    }];
    
    
    
    _commentLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(13)] textColor:COLOR_RGB_51];
    [self.contentView addSubview:_commentLab];
    [_commentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headImgV.mas_bottom).mas_offset(Size(15));
        make.right.mas_offset(-Size(148/2));
        make.left.mas_offset(Size(15));
        make.bottom.mas_offset(Size(-15));
    }];
    _commentLab.numberOfLines = 1;
    
    
    _dateLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(13)] textColor:COLOR_RGB_153];
    [self.contentView addSubview:_dateLab];
    [_dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(Size(-15));
        make.centerY.equalTo(_jobLab);
    }];
    
    
    _likeBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"0" backgroundColor:nil titleColor:COLOR_RGB_153 titleSize:Size(13)];
    [self.contentView addSubview:_likeBtn];
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(Size(-15));
        make.top.equalTo(_dateLab.mas_bottom).mas_offset(Size(15));
    }];
    [_likeBtn setImage:[UIImage imageNamed:@"职位详情-点赞1"] forState:UIControlStateNormal];
    [_likeBtn setImage:[UIImage imageNamed:@"职位详情-点赞2"] forState:UIControlStateSelected];
    [_likeBtn ym_layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:Size(5)];
    [_likeBtn addTarget:self action:@selector(doLikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *tempImgV;
    for (int i = 0; i<5; i++) {
        UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"职位详情-收藏01"]];
        [self.contentView addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            if (!tempImgV) {
                make.right.equalTo(_scoreLab.mas_left).mas_offset(Size(-7));
                make.centerY.equalTo(_scoreLab);
            }else{
                make.right.equalTo(tempImgV.mas_left).mas_offset(Size(-4));
                make.top.equalTo(tempImgV);
            }
            make.width.height.mas_equalTo(Size(23/2));
            
        }];
        tempImgV = imgV;
        [self.starImgArr insertObject:imgV atIndex:0];
    }
    
    _line = [UIView new];
    _line.backgroundColor = COLOR_RGB_line;
    [self.contentView addSubview:_line];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(15));
        make.right.mas_offset(-Size(15));
        make.height.mas_equalTo(0.5);
        make.bottom.mas_offset(0);
    }];
    
    //[UIImage imageNamed:@"个人中心头像"];
//    _nameLab.text = @"陈**";
//    _scoreLab.text = @"4.4分";
//    _jobLab.text = @"面试岗位：产品经理";
//    _commentLab.text = @"评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论";
//    _dateLab.text = @"2018-12-22";
}
-(void)setScore:(NSString *)score{
    _score = score;
    CGFloat s = score.floatValue;
    for (int i = 0; i<5; i++) {
        if (i<floorf(s)) {
            self.starImgArr[i].image = [UIImage imageNamed:@"职位详情-收藏02"];
        }else{
            self.starImgArr[i].image = [UIImage imageNamed:@"职位详情-收藏01"];
        }
    }
    if (s - floorf(s) == 0) {
        
    }else{
        [self.starImgArr objectAtIndex:(NSUInteger )(ceilf(s)-1)].image = [UIImage imageNamed:@"半颗心"];
    }
}
-(void)setCommentType:(CommentDetailType)commentType{
    _commentType = commentType;
    
    
    if (commentType == commentDetailTypeComment) {
        NSArray *markArr = @[@"",@"",@""];
        UILabel *tempLab;
        for (int i=0; i<markArr.count; i++) {
            
            
            UILabel *lab = [UILabel ym_labelWithFrame:CGRectZero font:FONT_SIZE_12 textColor:COLOR_RGB_153 textAlignment:NSTextAlignmentCenter];
            [self.contentView addSubview:lab];
            lab.text = markArr[i];
            lab.backgroundColor = COLOR_BG;
            lab.layer.cornerRadius = Size(5);
            lab.clipsToBounds = YES;
//            CGFloat w = [markArr[i] ym_getStringWidthfont:FONT_SIZE_12] + Size(16);
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.width.mas_equalTo(w);
                make.height.mas_equalTo(Size(18));
                if (!tempLab) {
                    make.left.mas_offset(Size(15));
                }else{
                    make.left.equalTo(tempLab.mas_right).mas_offset(Size(8));
                }
                make.top.equalTo(_headImgV.mas_bottom).mas_offset(Size(15));
            }];
            
            tempLab = lab;
            [self.tagLabArr addObject:lab];
        }
        
        
        _commentLab.numberOfLines = 0;
        [_commentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_headImgV.mas_bottom).mas_offset(Size(15+15+18));
            make.right.mas_offset(-Size(15));
            
        }];
    }
    
}
-(void)setList:(CommentDetailList *)list{
    _list = list;
    
    [_headImgV sd_setImageWithURL:[NSURL URLWithString:list.headImageUrl] placeholderImage:[UIImage imageNamed:@"头像"]];
    _nameLab.text = list.real_name;//@"陈**";
    _scoreLab.text = [NSString stringWithFormat:@"%@分",list.totalScore];//@"4.4分";
    _jobLab.text = [NSString stringWithFormat:@"面试岗位：%@",list.job_name];//@"面试岗位：产品经理";
    _commentLab.text = list.content;//@"评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论";
    _dateLab.text = [[NSDate dateWithTimeIntervalSince1970:list.create_time/1000] stringWithFormat:@"yyyy-MM-dd"];//@"2018-12-22";
    
    self.score = list.totalScore;
    
    if ([list.isGood isEqualToString:@"n"]) {//是否点赞(y:否,n:是)
        self.likeBtn.selected = YES;
    }else{
        self.likeBtn.selected = NO;
    }
    [self.likeBtn setTitle:NSStringFromInteger(list.goodCounts) forState:UIControlStateNormal];
    [self.likeBtn ym_layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:Size(5)];
    
    self.markArr = [list.title componentsSeparatedByString:@" "];
}
-(void)setMarkArr:(NSArray *)markArr{
    _markArr = markArr;
    
    for (int i=0; i<markArr.count; i++) {
        self.tagLabArr[i].text = markArr[i];
        [self.tagLabArr[i] mas_updateConstraints:^(MASConstraintMaker *make) {
            
            if (i == markArr.count-1) {
                make.width.mas_equalTo([self.tagLabArr[i].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10)).priorityHigh();
                make.right.mas_lessThanOrEqualTo(Size(35));
            }else{
                make.width.mas_equalTo([self.tagLabArr[i].text ym_getStringWidthfont:[UIFont systemFontOfSize:Size(12)]] + Size(10));
            }
        }];
    }
    
}

-(void)setModel:(JobDetailComment *)model{
    _model = model;
    
    [_headImgV sd_setImageWithURL:[NSURL URLWithString:model.headImageUrl] placeholderImage:[UIImage imageNamed:@"头像"]];
    _nameLab.text = model.real_name;//@"陈**";
    _scoreLab.text = [NSString stringWithFormat:@"%@分",model.totalScore];//@"4.4分";
    _jobLab.text = [NSString stringWithFormat:@"面试岗位：%@",model.job_name];//@"面试岗位：产品经理";
    _commentLab.text = model.content;//@"评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论";
    _dateLab.text = [[NSDate dateWithTimeIntervalSince1970:model.create_time/1000] stringWithFormat:@"yyyy-MM-dd"];//@"2018-12-22";
    
    self.score = model.totalScore;
    
    if ([model.isGood isEqualToString:@"n"]) {//是否点赞(y:否,n:是)
        self.likeBtn.selected = YES;
    }else{
        self.likeBtn.selected = NO;
    }
    [self.likeBtn setTitle:NSStringFromInteger(model.goodCounts) forState:UIControlStateNormal];
    [self.likeBtn ym_layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:Size(5)];
}

-(void)doLikeBtn:(UIButton *)btn{
    BLOCK_EXEC(self.likeBtnBlock,btn);
}

-(NSMutableArray<UIImageView *> *)starImgArr{
    if (!_starImgArr) {
        _starImgArr = [NSMutableArray array];
    }
    return _starImgArr;
}
-(NSMutableArray<UILabel *> *)tagLabArr{
    if (!_tagLabArr) {
        _tagLabArr = [NSMutableArray array];
    }
    return _tagLabArr;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
