//
//  BaseViewController.m
//  TestDemo
//
//  Created by 孙若淮 on 14/03/2018.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"
#import "MainTabBarController.h"
#import "ActionSheetShareView.h"

@interface BaseViewController (){
    
}
@property (nonatomic, strong) SuspendedBtnBlock suspendedBtnBlock;
@property (nonatomic, strong) ActionSheetShareView *sheetShareView;


@end


@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationController.navigationBar setBarTintColor:COLOR_MAIN];
    self.view.backgroundColor = COLOR_BG;
    
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    
}

#pragma mark - func
//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


//MARK: - 登录
/**
 判断是否登录在线
 
 @return YES 在线 NO 不在线
 */
-(BOOL)online{
    if (AppDelegateInstance.token) {
        return YES;
    }
    //    if (DefaultsGetBool(KEY_IS_LOGIN)) {
    //        return YES;
    //    }
    return NO;
}


/**
 跳转到登录界面
 */
-(void)jumpToLogin{
    
    [self presentViewController:[[BaseNavigationController alloc]initWithRootViewController:[LoginViewController new]] animated:YES completion:nil];
}

//MARK: - 客服悬浮按钮
-(UIButton *)suspendedBtn{
    if (!_suspendedBtn) {
        _suspendedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_suspendedBtn setImage:[UIImage imageNamed:@"客服默认占位图"] forState:UIControlStateNormal];
        [_suspendedBtn addTarget:self action:@selector(suspendedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _suspendedBtn.hidden = YES;
    }
    return _suspendedBtn;
}




-(void)showSuspendedBtn:(SuspendedBtnBlock)block{
    [self.view addSubview:self.suspendedBtn];
    [self.suspendedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(0);
//        make.width.height.mas_equalTo(Size(80));
        make.centerY.equalTo(self.view);
    }];
    self.suspendedBtn.hidden = NO;
    self.suspendedBtnBlock = block;
}


-(ActionSheetShareView *)sheetShareView{
    if (!_sheetShareView) {
        _sheetShareView = [[ActionSheetShareView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    }
    return _sheetShareView;
}

//底部弹出分享按钮
-(void)sheetShareShowWithShanreBlock:(void(^)(NSString *btntitle)) block{
    [self.sheetShareView show];
    self.sheetShareView.shareBtnBlock = block;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{

    
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
