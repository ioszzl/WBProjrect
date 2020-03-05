//
//  ForgetPasswordViewController.m
//  TestDemo
//
//  Created by eims on 2018/6/21.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "LZAlertView.h"
#import "LoginViewController.h"
@interface ForgetPasswordViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UITextField *verifyTF;
@property (nonatomic, strong) UITextField *psdTF;
@property (nonatomic, strong) UITextField *againPsdTF;
@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"重置密码";
    [self initUI];
    // Do any additional setup after loading the view.
}

-(void)initUI{
    self.view.backgroundColor = RGBCOLOR(248, 249, 251);
    
    //手机号
    UIView * phoneBgV = [UIView new];
    phoneBgV.backgroundColor = RGBCOLOR(255, 255, 255);
    [self.view addSubview:phoneBgV];
    [phoneBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(Size(10));
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(Size(120/2));
    }];
    
    UIImageView *phoneIconV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mobilephonenumber"]];
    phoneIconV.contentMode = UIViewContentModeScaleAspectFit;
    [phoneBgV addSubview:phoneIconV];
    [phoneIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneBgV);
        make.height.mas_equalTo(Size(38/2));
        make.width.mas_equalTo(Size(28/2));
        make.left.mas_offset(Size(38/2));
    }];
    
    UIView *phoneLine = [UIView new];
    phoneLine.backgroundColor = RGBCOLOR(239, 239, 239);
    [phoneBgV addSubview:phoneLine];
    [phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(phoneBgV);
        make.height.mas_equalTo(0.5);
        make.width.equalTo(phoneBgV);
    }];
    
    self.phoneTF = [UITextField ym_textFieldWithFrame:CGRectZero placeholder:@"请输入手机号" font:Size(15) textColor:COLOR_RGB_51 tag:0];
    self.phoneTF.delegate = self;
    [phoneBgV addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneIconV.mas_right).mas_offset(Size(13));
        make.top.bottom.right.mas_offset(0);
    }];
    
    //验证码
    UIView * verifyBgV = [UIView new];
    verifyBgV.backgroundColor = RGBCOLOR(255, 255, 255);
    [self.view addSubview:verifyBgV];
    [verifyBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneBgV.mas_bottom).mas_offset(0.5);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(Size(120/2));
    }];
    
    UIImageView *verifyIconV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SMSverificationcode"]];
    verifyIconV.contentMode = UIViewContentModeScaleAspectFit;
    [verifyBgV addSubview:verifyIconV];
    [verifyIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(verifyBgV);
        make.height.mas_equalTo(Size(38/2));
        make.width.mas_equalTo(Size(28/2));
        make.left.mas_offset(Size(38/2));
    }];
    
    UIView *verifyLine = [UIView new];
    verifyLine.backgroundColor = RGBCOLOR(239, 239, 239);
    [verifyBgV addSubview:verifyLine];
    [verifyLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(verifyBgV);
        make.height.mas_equalTo(0.5);
        make.width.equalTo(verifyBgV);
    }];
    
    self.verifyTF = [UITextField ym_textFieldWithFrame:CGRectZero placeholder:@"请输入验证码" font:Size(15) textColor:COLOR_RGB_51 tag:0];
    self.verifyTF.delegate = self;
    [verifyBgV addSubview:self.verifyTF];
    [self.verifyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(verifyIconV.mas_right).mas_offset(Size(13));
        make.top.bottom.mas_offset(0);
        make.width.mas_lessThanOrEqualTo(Size(462/2));
    }];
    
    UIButton *verifyBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"发送验证码" backgroundColor:nil titleColor:RGBCOLOR(102, 102, 102) titleSize:Size(14)];
    [verifyBgV addSubview:verifyBtn];
    [verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(38/2));
        make.centerY.mas_equalTo(verifyBgV);
    }];
    [verifyBtn addTarget:self action:@selector(doVerifyBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //密码
    UIView * psdBgV = [UIView new];
    psdBgV.backgroundColor = RGBCOLOR(255, 255, 255);
    [self.view addSubview:psdBgV];
    [psdBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(verifyBgV.mas_bottom).mas_offset(0.5);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(Size(120/2));
        
    }];
    
    UIImageView *psdIconV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Pleaseenterpassword"]];
    psdIconV.contentMode = UIViewContentModeScaleAspectFit;
    [psdBgV addSubview:psdIconV];
    [psdIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(psdBgV);
        make.height.mas_equalTo(Size(38/2));
        make.width.mas_equalTo(Size(28/2));
        make.left.mas_offset(Size(38/2));
    }];
    
    UIView *psdLine = [UIView new];
    psdLine.backgroundColor = RGBCOLOR(239, 239, 239);
    [psdBgV addSubview:psdLine];
    [psdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(psdBgV);
        make.height.mas_equalTo(0.5);
        make.width.equalTo(psdBgV);
    }];
    
    self.psdTF = [UITextField ym_textFieldWithFrame:CGRectZero placeholder:@"请输入8~16位数字+字母" font:Size(15) textColor:COLOR_RGB_51 tag:0];
    self.psdTF.secureTextEntry = YES;
    self.psdTF.delegate = self;
    [psdBgV addSubview:self.psdTF];
    [self.psdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(psdIconV.mas_right).mas_offset(Size(13));
        make.top.bottom.right.mas_offset(0);
    }];
    
    //再次密码
    UIView * againPsdBgV = [UIView new];
    againPsdBgV.backgroundColor = RGBCOLOR(255, 255, 255);
    [self.view addSubview:againPsdBgV];
    [againPsdBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(psdBgV.mas_bottom).mas_offset(0.5);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(Size(120/2));
        
    }];
    
    UIImageView *againPsdIconV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Pleaseenterpassword"]];
    againPsdIconV.contentMode = UIViewContentModeScaleAspectFit;
    [againPsdBgV addSubview:againPsdIconV];
    [againPsdIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(againPsdBgV);
        make.height.mas_equalTo(Size(38/2));
        make.width.mas_equalTo(Size(28/2));
        make.left.mas_offset(Size(38/2));
    }];
    
    
    
    self.againPsdTF = [UITextField ym_textFieldWithFrame:CGRectZero placeholder:@"请输入8~16位数字+字母" font:Size(15) textColor:COLOR_RGB_51 tag:0];
    self.againPsdTF.secureTextEntry = YES;
    self.againPsdTF.delegate = self;
    [againPsdBgV addSubview:self.againPsdTF];
    [self.againPsdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(againPsdIconV.mas_right).mas_offset(Size(13));
        make.top.bottom.right.mas_offset(0);
    }];
    
    UIButton * resetPsdBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"确定" backgroundColor:COLOR_MAIN titleColor:COLOR_RGB_51 titleSize:Size(17)];
    [self.view addSubview:resetPsdBtn];
    [resetPsdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(againPsdBgV.mas_bottom).mas_offset(Size(90/2));
        make.width.mas_equalTo(Size(690/2));
        make.height.mas_equalTo(Size(98/2));
        make.centerX.equalTo(self.view);
    }];
    [resetPsdBtn addTarget:self action:@selector(doResetPsdBtn) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - action
-(void)doVerifyBtn:(UIButton *)btn{
    [self.view endEditing:YES];
    
    if (self.phoneTF.text.length == 0) {
        [HUD showHUDError:nil title:@"请输入手机号"];
        return;
    }
    if (![NSString ym_validateMobile:self.phoneTF.text]) {
        [HUD showHUDError:nil title:@"请输入正确手机号"];
        return;
    }
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    [dataDic setValue:self.phoneTF.text forKey:@"phone"];
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    [paramDic setValue:[dataDic mj_JSONString] forKey:@"data"];
    
    [[RHNetAPIManager sharedManager]appGetSmsCodeOPT:paramDic].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
        if (data) {
            [btn ym_startTimer];
        }
    });
    
}

-(void)doResetPsdBtn{
    [self.view endEditing:YES];
    
    if (self.phoneTF.text.length == 0) {
        [HUD showHUDError:nil title:@"请输入手机号"];
        return;
    }
    if (self.verifyTF.text.length == 0) {
        [HUD showHUDError:nil title:@"请输入验证码"];
        return;
    }
    if (self.psdTF.text.length == 0) {
        [HUD showHUDError:nil title:@"请输入密码"];
        return;
    }
    if (self.psdTF.text.length < 8 || self.psdTF.text.length > 16) {
        [HUD showHUDError:nil title:@"请输入8~16位数字+字母"];
        return;
    }
    if ([NSString isAllLetter:self.psdTF.text] || [NSString isAllNumber:self.psdTF.text]) {
        [HUD showHUDError:nil title:@"请输入8~16位数字+字母"];
        return;
    }
    if (![self.psdTF.text isEqualToString:self.againPsdTF.text]) {
        [HUD showHUDError:nil title:@"两次输入的密码不一致"];
        return;
    }
    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    [dataDic setValue:self.phoneTF.text forKey:@"phone"];
    [dataDic setValue:self.verifyTF.text forKey:@"code"];
    [dataDic setValue:self.psdTF.text forKey:@"pwd"];
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    [paramDic setValue:[dataDic mj_JSONString] forKey:@"data"];
    
    [[RHNetAPIManager sharedManager]appResetPwdOPT:paramDic].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
        if (data) {
            [HUD showHUDSuccess:nil title:msg];
            [self.navigationController popViewControllerAnimated:YES];
        }
    });
    
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
