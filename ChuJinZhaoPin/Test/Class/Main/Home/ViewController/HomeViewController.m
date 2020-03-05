//
//  HomeViewController.m
//  TestDemo
//
//  Created by 孙若淮 on 15/03/2018.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "HomeViewController.h"
#import "TYPageControl.h"
#import "TYCyclePagerView.h"
#import "TYCyclePagerViewCell.h"
#import "CompleteInformationAlertView.h"
#import "SliderNewsTableViewCell.h"
#import "HomeJobListTableViewCell.h"
#import "SearchViewController.h"
#import "CityFilterView.h"
#import "EducationFilterView.h"
#import "CJAlertView.h"
#import "HomeModel.h"
#import "HomeIndexListModel.h"
#import "SearchResultViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface HomeViewController()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self initUI];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
}
-(void)initUI{

    
    
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
