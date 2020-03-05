//
//  MainTabBarController.m
//  TestDemo
//
//  Created by 孙若淮 on 14/03/2018.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "FindIndexViewController.h"
#import "MineIndexViewController.h"
#import "BaseTabBar.h"

@interface MainTabBarController ()
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HomeViewController *vc1 = [HomeViewController new];
    FindIndexViewController *vc3 = [FindIndexViewController new];
    MineIndexViewController *vc4 = [MineIndexViewController new];
    
    
    NSArray<BaseViewController*> *vcArray = @[vc1,vc3,vc4];
    NSArray *tabBarArray = @[@"首页",@"发现",@"我的"];
    NSArray *naviArray = @[@"",@"",@""];
    
    NSArray *imageArray = @[@"首页01",@"发现01",@"我的01"];
    NSArray *selectedImageArray = @[@"首页02",@"发现02",@"我的02"];
    [self setUpChildVC:vcArray title:naviArray tabBar:tabBarArray image:imageArray selectedImage:selectedImageArray];
    
    BaseTabBar *baseTabBar = [[BaseTabBar alloc] init];
    [self setValue:baseTabBar forKey:@"tabBar"];
}

-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed{
    [super setHidesBottomBarWhenPushed:hidesBottomBarWhenPushed];
    if (hidesBottomBarWhenPushed) {
        
    }else{
        
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
}

#pragma mark - PrivateMethod 私有实现方法
-(void)setUpChildVC:(NSArray<BaseViewController*>*)viewController title:(NSArray*)title tabBar:(NSArray*)tabBar image:(NSArray*)image selectedImage:(NSArray*)selectedImage{
    for (int i = 0; i< viewController.count; i++) {
        BaseViewController * vc = [viewController objectAtIndex:i];
        vc.navigationItem.title = [title objectAtIndex:i];
        vc.tabBarItem.title = [tabBar objectAtIndex:i];
        [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, - 4)];
        
        [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGBCOLOR(51, 51, 51),NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];//默认字体颜色
        UIColor *selectColor = AppDelegateInstance.userType == 1 ? RGBCOLOR(75, 179, 240) : RGBCOLOR(255, 187, 21);
        [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:selectColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];//选中字体颜色
        vc.tabBarItem.image = [[UIImage imageNamed:[image objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:[selectedImage objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        BaseNavigationController *navi = [[BaseNavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:navi];
    }
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
