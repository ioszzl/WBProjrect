//
//  HomeIndexListModel.h
//  Test
//
//  Created by eims on 2018/11/19.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface HomeIndexList :NSObject
@property (nonatomic , copy) NSString              * is_apply;//是否申请(n:已申请,y:没申请)
@property (nonatomic , assign) NSInteger              work_year;//工作经验(0,应届生 1.1-2年 2.3-5年 3.5-10年,410年以上)
@property (nonatomic , copy) NSString              * pay_plan;//发薪安排
@property (nonatomic , copy) NSString              * fpath;//host_name+group_name+fpath为公司logo
@property (nonatomic , copy) NSString              * department;
@property (nonatomic , assign) NSInteger              ID;
@property (nonatomic , copy) NSString              * des_card_ids;//描述卡id
@property (nonatomic , copy) NSString              * company_address;//公司地址
@property (nonatomic , copy) NSString              * host_name;
@property (nonatomic , copy) NSString              * work_time;//工作时间
@property (nonatomic , assign) NSInteger              company_id;//公司id
@property (nonatomic , copy) NSString              * bed_situation;//住宿情况
@property (nonatomic , assign) NSInteger              industry_class_id;//行业类别id
@property (nonatomic , assign) NSInteger              com_user_id;//发布职位者id
@property (nonatomic , copy) NSString              * group_name;
@property (nonatomic , copy) NSString              * job_duty;//岗位职责
@property (nonatomic , copy) NSString              * is_deleted;//是否删除(y:是 n:否)
@property (nonatomic , copy) NSString              * social_good;//社保福利
@property (nonatomic , copy) NSString              * work_class;//行业类别,
@property (nonatomic , copy) NSString              * other_good;//其他福利
@property (nonatomic , copy) NSString              * job_name;//岗位名称
@property (nonatomic , assign) NSInteger              create_time;//创建时间
@property (nonatomic , assign) CGFloat              distance;//距离你的位置,//距离(单位:千米)
@property (nonatomic , copy) NSString              * total_pay;//综合工资
@property (nonatomic , assign) NSInteger              education_level;//学历 (0,不限 1.大专 2.本科 3.研究生 4.博士)
@property (nonatomic , copy) NSString              * work_requirement;//任职要求
@property (nonatomic , assign) CGFloat              longitude;//经度
@property (nonatomic , copy) NSString              * detailed_treatment;
@property (nonatomic , assign) NSInteger              post_money_open;//是否开启职位押金
@property (nonatomic , copy) NSString              * status;//发布状态(0.招聘中 1.未发布 2.已暂停)
@property (nonatomic , copy) NSString              * basic_pay;//部门
@property (nonatomic , copy) NSString              * show_range;//薪资显示范围
@property (nonatomic , assign) NSInteger              post_money;//职位押金
@property (nonatomic , copy) NSString              * companyLogo;//公司logo
@property (nonatomic , copy) NSString              * total_star;//星级评分
@property (nonatomic , assign) NSInteger              salary_range_id;//薪资id
@property (nonatomic , copy) NSString              * company_name;//公司名称
@property (nonatomic , copy) NSString              * work_style;//工作方式
@property (nonatomic , assign) NSInteger              work_address_region_id;//就职区域id
@property (nonatomic , copy) NSString              * push_time;//发布时间戳
@property (nonatomic , copy) NSString              * food_situation;//伙食情况
@property (nonatomic , copy) NSString              * work_address;//就职区域
@property (nonatomic , assign) CGFloat              latitude;//纬度

@property (nonatomic , assign) NSInteger              is_collect;//是否收藏(n:收藏,y:没收藏)
@property (nonatomic , copy) NSString              * basic_good;//基础福利
@end

@interface HomeIndexListData :NSObject
@property (nonatomic , assign) NSInteger              pageSize;//总记录数
@property (nonatomic , assign) BOOL              hasNextPage;//是否有下一页
@property (nonatomic , assign) NSInteger              pages;//总页数
@property (nonatomic , assign) NSInteger              pageNum;//当前页
@property (nonatomic , assign) NSInteger              lastPage;
@property (nonatomic , copy) NSArray<NSNumber *>              * navigatepageNums;
@property (nonatomic , assign) BOOL              isLastPage;
@property (nonatomic , assign) NSInteger              total;//总记录数
@property (nonatomic , copy) NSString              * orderBy;
@property (nonatomic , assign) NSInteger              nextPage;
@property (nonatomic , assign) NSInteger              size;
@property (nonatomic , assign) BOOL              hasPreviousPage;
@property (nonatomic , assign) NSInteger              navigatePages;
@property (nonatomic , assign) NSInteger              startRow;
@property (nonatomic , assign) NSInteger              prePage;
@property (nonatomic , copy) NSArray<HomeIndexList *>              * list;
@property (nonatomic , assign) NSInteger              firstPage;
@property (nonatomic , assign) BOOL              isFirstPage;
@property (nonatomic , assign) NSInteger              endRow;

@end


@interface HomeIndexListModel : BaseModel
@property (nonatomic , strong) HomeIndexListData              * data;
@end

NS_ASSUME_NONNULL_END
