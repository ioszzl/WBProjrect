//
//  SearchResultViewController.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/2.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "SearchResultViewController.h"
#import "HomeJobListTableViewCell.h"
#import "SearchResultFliterView.h"
#import "HomeIndexListModel.h"
#import "YMAddressPickView.h"
@interface SearchResultViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger _defaultEduIndex;
    NSInteger _defaultYearIndex;
    NSInteger _defaultPayIndex;
    NSDictionary *_filterTradeDic;
    
    NSInteger _pageNum;
}
@property (nonatomic, strong) UITableView *tableV;
@property (nonatomic, strong) NSArray<HomeIndexList *> *dataSource;

@property (nonatomic, strong) NSMutableDictionary *paramDataDic;
@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview: self.tableV];
    // Do any additional setup after loading the view.
    
    _pageNum = 1;
    [self requestListData];
}

#pragma mark - request
-(void)requestListData{
    
    [self.paramDataDic setValue:@"0" forKey:@"type"];
    if ([self.title isEqualToString:@"全部分类"]) {
        [self.paramDataDic setValue:@"" forKey:@"jobName"];
    }else{
        [self.paramDataDic setValue:self.title forKey:@"jobName"];
    }
    
    
    NSMutableDictionary *page = [NSMutableDictionary dictionary];
    [page setValue:@(_pageNum) forKey:@"currPage"];
    [page setValue:@10 forKey:@"pageSize"];
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    [paramDic setValue:[self.paramDataDic mj_JSONString] forKey:@"data"];
    [paramDic setValue:[page mj_JSONString] forKey:@"page"];
    [paramDic setObject:AppDelegateInstance.token forKey:@"token"];
    
    [[RHNetAPIManager sharedManager]appPostsSearchOPT:paramDic].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
        if (data) {
            HomeIndexListModel *model = [HomeIndexListModel mj_objectWithKeyValues:data];
            if (model.data.list.count == 0) {
                [HUD showHUDError:nil title:@"暂无数据"];
            }
            if (_pageNum == 1) {
                self.dataSource = model.data.list;
                [self.tableV.mj_header endRefreshing];
                [self.tableV.mj_footer resetNoMoreData];
            }else{
                NSMutableArray *temp = [NSMutableArray arrayWithArray:self.dataSource];
                [temp addObjectsFromArray:model.data.list];
                self.dataSource = [temp copy];
                
            }
            if (model.data.isLastPage) {
                [self.tableV.mj_footer endRefreshingWithNoMoreData];
            }else{
                [self.tableV.mj_footer endRefreshing];
            }
            
            [self.tableV reloadData];
            
        }else{
            [self.tableV.mj_header endRefreshing];
            [self.tableV.mj_footer endRefreshing];
        }
    });
}
#pragma mark - tableview / delegate
-(UITableView *)tableV{
    if (!_tableV) {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavBarHeight) style:UITableViewStyleGrouped];
        _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableV.showsVerticalScrollIndicator = NO;
        _tableV.showsHorizontalScrollIndicator = NO;
        _tableV.backgroundColor = COLOR_BG;
        _tableV.dataSource = self;
        _tableV.delegate = self;
        
        _tableV.mj_header = [YMRefreshHeader ym_headerWithRefreshingsBlock:^{
            _pageNum = 1;
            [self requestListData];
        } animated:NO];
        
        _tableV.mj_footer = [YMRefreshFooter ym_footerWithRefreshingsBlock:^{
            _pageNum++;
            [self requestListData];
        } animated:NO];
    }
    return _tableV;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CELL_DEFINE(HomeJobListTableViewCell);
    cell.model = self.dataSource[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Size(262/2+5);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerV"];
    if (!view) {
        view = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"headerV"];
        
        SearchResultFliterView *fliterV = [[SearchResultFliterView alloc]initWithFrame:CGRectZero];
        [view addSubview:fliterV];
        [fliterV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(Size(5));
            make.bottom.mas_offset(-Size(10));
            make.left.right.mas_offset(0);
        }];
        fliterV.selectEduIndex = _defaultEduIndex;
        fliterV.selectYearIndex = _defaultYearIndex;
        fliterV.selectPayIndex = _defaultPayIndex;
        WeakSelf(fliterV);
        fliterV.educationBtnBlock = ^(UIButton * _Nonnull btn, NSInteger eduID) {
            _defaultEduIndex = btn.tag;
            
            [self.paramDataDic setValue:eduID == -1 ? @"" : NSStringFromInteger(eduID) forKey:@"educationLevel"];
            _pageNum = 1;
            [self requestListData];
        };
        fliterV.yearBtnBlock = ^(UIButton * _Nonnull btn, NSInteger yearID) {
            _defaultYearIndex = btn.tag;
            [self.paramDataDic setValue:yearID == -1 ? @"" : NSStringFromInteger(yearID) forKey:@"workYear"];
            _pageNum = 1;
            [self requestListData];
        };
        fliterV.payBtnBlock = ^(UIButton * _Nonnull btn, NSInteger payID) {
            _defaultPayIndex = btn.tag;
            [self.paramDataDic setValue:payID == -1 ? @"" : NSStringFromInteger(payID) forKey:@"salaryRangeId"];
            _pageNum = 1;
            [self requestListData];
        };
        fliterV.cityBtnBlock = ^(UIButton * _Nonnull btn) {
            YMAddressPickView *pickV = [[YMAddressPickView alloc]initWithUI:0 y:kScreenHeight width:kScreenWidth height:0];
            pickV.AdressBlock = ^(NSString *province, NSString *city, NSString *town, NSString *pid, NSString *cid, NSString *tid) {
                weakfliterV.cityArr = @[[NSString stringWithFormat:@"%@%@%@",province,city,town]];
                
                [self.paramDataDic setValue:tid forKey:@"workAddressRegionId"];
                _pageNum = 1;
                [self requestListData];
            };
            [pickV showBottomView];
        };
        
        fliterV.tradeBtnBlock = ^(UIButton * _Nonnull btn) {
            
        };
    }
    //UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, Size(426/2))];
    
    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return Size(426/2);
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - 懒加载
-(NSMutableDictionary *)paramDataDic{
    if (!_paramDataDic) {
        _paramDataDic = [NSMutableDictionary dictionary];
    }
    return _paramDataDic;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
