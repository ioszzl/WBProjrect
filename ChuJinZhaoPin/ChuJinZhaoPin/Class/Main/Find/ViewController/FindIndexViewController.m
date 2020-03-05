//
//  FindIndexViewController.m
//  TestDemo
//
//  Created by eims on 2018/6/20.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import "FindIndexViewController.h"
#import "FindIndexListTableViewCell.h"
@interface FindIndexViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableV;
@end

@implementation FindIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    [self.view addSubview:self.tableV];
    
    [self.suspendedBtn setImage:[UIImage imageNamed:@"客服"] forState:UIControlStateNormal];
    [self showSuspendedBtn:^(UIButton *btn) {
        
    }];
    // Do any additional setup after loading the view.
}
-(UITableView *)tableV{
    if (!_tableV) {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavBarHeight-kTabBarHeight) style:UITableViewStylePlain];
        if (@available(iOS 11.0, *)) {
            _tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
            // Fallback on earlier versions
        }
        _tableV.tableFooterView = [UIView new];
        _tableV.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableV.contentInset = UIEdgeInsetsMake(Size(10), 0, 0, 0);
        _tableV.showsVerticalScrollIndicator = NO;
        _tableV.showsHorizontalScrollIndicator = NO;
        _tableV.backgroundColor = COLOR_BG;
        
        _tableV.dataSource = self;
        _tableV.delegate = self;
        
    }
    return _tableV;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CELL_DEFINE(FindIndexListTableViewCell);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Size(120/2);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
