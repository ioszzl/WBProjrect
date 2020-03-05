//
//  SearchViewController.m
//  ChuJinZhaoPin
//
//  Created by eims on 2018/11/2.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "SearchViewController.h"
#import "HotSearchTableViewCell.h"
#import "SearchHistoryTableViewCell.h"
#import "SearchResultViewController.h"
#import "UserHotSaerchModel.h"
#import "SearchHistoryManager.h"
@interface SearchViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITextField *searchTF;
@property (nonatomic, strong) UITableView *tableV;
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) UserHotSaerchModel *hotSearchM;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
   
}

-(void)initUI{
    [self setNavi];
    [self.view addSubview:self.tableV];
    self.dataSource = [[SearchHistoryManager sharedDataBase]getAllHistorySearchRecord];
   
    
    [self requestHotSearch];
}
/**
 设置导航栏
 */
-(void)setNavi {
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, kStatusHeight, kScreenWidth-Size(64/2), 44)];
    self.navigationItem.titleView = bgView;
    if (@available(iOS 11.0, *)) {
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(Size(600/2));
            make.height.mas_equalTo(44);
        }];
    }
    
    bgView.userInteractionEnabled = YES;

    
    UIView *searchView = [UIView new];
    searchView.layer.cornerRadius = 54/4;
    searchView.clipsToBounds = YES;
    searchView.backgroundColor = RGBCOLOR(255, 255, 255);
    [bgView addSubview:searchView];
    [searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.equalTo(bgView);
        make.height.mas_equalTo(54/2);
        make.width.mas_equalTo(Size(493/2+20));
    }];
    
    UIImageView *searchImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"首页搜索"]];
    searchImageView.contentMode = UIViewContentModeScaleAspectFit;
    [searchView addSubview:searchImageView];
    [searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(8));
        make.width.mas_equalTo(Size(24/2));
        make.top.bottom.mas_offset(0);
    }];
    
    UITextField *searchTF = [UITextField new];
    searchTF.textColor = COLOR_RGB_51;
    searchTF.font = FONT_SIZE_12;
    searchTF.placeholder = @"搜索职位/公司";
    searchTF.delegate = self;
    [searchView addSubview:searchTF];
    self.searchTF = searchTF;
    [searchTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(searchImageView.mas_right).mas_offset(Size(5));
        make.width.mas_equalTo(Size(410/2));
        make.top.bottom.mas_offset(0);
    }];
    
    
    
    UIButton *searchBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"搜索" backgroundColor:nil titleColor:RGBCOLOR(255, 255, 255) titleSize:Size(15)];

    [searchBtn addTarget:self action:@selector(doSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:searchBtn];
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(searchView.mas_right).mas_offset(Size(15));
        make.centerY.equalTo(searchView);
    }];
    
    
    
}
#pragma mark - request
-(void)requestHotSearch{
    if (AppDelegateInstance.userType == 1) {//企业
        [[RHNetAPIManager sharedManager]appGetCompanyHotSearchOPT].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
            if (data) {
                self.hotSearchM = [UserHotSaerchModel mj_objectWithKeyValues:data];
                [self.tableV reloadData];
            }
        });
        
    }else{
        [[RHNetAPIManager sharedManager]appGetUserHotSearchOPT].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
            if (data) {
                self.hotSearchM = [UserHotSaerchModel mj_objectWithKeyValues:data];
                [self.tableV reloadData];
            }
        });
    }
    
}

#pragma mark - action

-(void)doSearchBtn{
    if (self.searchTF.text.length == 0) {
        [HUD showHUDError:nil title:@"请输入搜索内容"];
        return;
    }
    
    [[SearchHistoryManager sharedDataBase]addHistorySearchRecord:self.searchTF.text];
    self.dataSource = [[SearchHistoryManager sharedDataBase]getAllHistorySearchRecord];
    [self.tableV reloadData];
    
    SearchResultViewController *vc = [SearchResultViewController new];
    vc.title = self.searchTF.text;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
-(void)doClearBtn{
    if (self.dataSource.count == 0) {
        return;
    }
    [[SearchHistoryManager sharedDataBase]removeAllHistorySearchRecord];
    self.dataSource = [[SearchHistoryManager sharedDataBase]getAllHistorySearchRecord];
    [self.tableV reloadData];
}
#pragma mark - tableView/delegate
-(UITableView *)tableV{
    if (!_tableV) {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavBarHeight) style:UITableViewStyleGrouped];
        _tableV.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableV.showsVerticalScrollIndicator = NO;
        _tableV.showsHorizontalScrollIndicator = NO;
        _tableV.backgroundColor = COLOR_BG;
        _tableV.dataSource = self;
        _tableV.delegate = self;
        
    }
    return _tableV;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CELL_DEFINE(HotSearchTableViewCell);
        cell.dataSource = self.hotSearchM.data;
        cell.itemDidSelectedBlock = ^(NSString *str,NSInteger index) {
            UserHotSaerchData *data = self.hotSearchM.data[index];
           
            SearchResultViewController *vc = [SearchResultViewController new];
            vc.title = str;
            [self.navigationController pushViewController:vc animated:YES];
            
            
        };
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }else{
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
    CELL_DEFINE(SearchHistoryTableViewCell);
    cell.contentLab.text = self.dataSource[indexPath.row];//@"需求分析师";
    cell.deleteBtnBlock = ^{
        NSLog(@"删除");
        [[SearchHistoryManager sharedDataBase] deleteHistorySearchRecord:self.dataSource[indexPath.row]];
        self.dataSource = [[SearchHistoryManager sharedDataBase]getAllHistorySearchRecord];
        [self.tableV reloadData];
    };
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return Size(62/2)*2+Size(15);
    }
    return Size(98/2);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, Size(96/2))];
    
    UILabel *titleLab = [UILabel ym_labelWithFrame:CGRectZero font:[UIFont systemFontOfSize:Size(13)] textColor:COLOR_RGB_51];
    [view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(Size(11));
        make.top.mas_offset(Size(25));
    }];
    
    if (section == 0) {
        titleLab.text = @"热门搜索";
    }else{
        titleLab.text = @"搜索历史";
        
        UIButton *clearBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"清空" backgroundColor:nil titleColor:COLOR_MAIN titleSize:Size(13)];
        [view addSubview:clearBtn];
        [clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-Size(10));
            make.centerY.equalTo(titleLab);
        }];
        [clearBtn addTarget:self action:@selector(doClearBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return Size(96/2);
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        SearchHistoryTableViewCell *cell = (SearchHistoryTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        
        SearchResultViewController *vc = [SearchResultViewController new];
        vc.title = cell.contentLab.text;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
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
