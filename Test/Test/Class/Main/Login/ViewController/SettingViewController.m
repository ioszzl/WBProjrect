//
//  SettingViewController.m
//  Test
//
//  Created by eims on 2018/12/5.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "SettingViewController.h"
#import "MineInfoTableViewCell.h"
#import "SettingInitModel.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableV;

@property (nonatomic, strong) SettingInitModel *model;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    
    [self requestInitData];
}
-(void)initUI{
    self.title = @"设置";
    
    UIButton *exitBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"退出登录" backgroundColor:nil titleColor:COLOR_MAIN titleSize:Size(15)];
    [self.view addSubview:exitBtn];
    [exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.mas_offset(-Size(35)-kSecrityHeight);
    }];
    [exitBtn addTarget:self action:@selector(doExitBtn) forControlEvents:UIControlEventTouchUpInside];
    
    _tableV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableV.tableFooterView = [UIView new];
    _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableV.showsVerticalScrollIndicator = NO;
    _tableV.showsHorizontalScrollIndicator = NO;
    _tableV.backgroundColor = COLOR_BG;
    _tableV.dataSource = self;
    _tableV.delegate = self;
    [self.view addSubview:_tableV];
    [_tableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(0);
        make.bottom.mas_equalTo(exitBtn.mas_top);
    }];
    _tableV.rowHeight = Size(120/2);
    
}
#pragma mark - request
-(void)requestInitData{
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    [paramDic setValue:AppDelegateInstance.token forKey:@"token"];
    
    [[RHNetAPIManager sharedManager]appSettingInitCopyOPT:paramDic].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
        if (data) {
            self.model = [SettingInitModel mj_objectWithKeyValues:data];
            
            [self.tableV reloadData];
        }
    });
}
#pragma mark - action
-(void)doExitBtn{
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_TOKEN];
//    
//    [self jumpSelectRole];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CELL_DEFINE(MineInfoTableViewCell);
    cell.textF.enabled = NO;
    switch (indexPath.row) {
        case 0://支付密码
        {
            cell.titleLab.text = @"支付密码";
            cell.textF.textColor = COLOR_MAIN;
            if (self.model.data.userLogin.payPwd) {
                cell.textF.text = @"修改";
            }else{
                 cell.textF.text = @"设置";
            }
           
        }
            break;
        case 1://更改密码
        {
            cell.titleLab.text = @"更改密码";
        }
            break;
        case 2://版本号
        {
            cell.titleLab.text = @"版本号";
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            cell.textF.text = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        }
            break;
        case 3://切换身份
        {
            cell.titleLab.text = @"切换身份";
            cell.textF.text = AppDelegateInstance.userType == 1 ? @"我要求职" : @"我要招聘";
        }
            break;
        default:
            break;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
