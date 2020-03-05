//
//  RegistViewController.m
//  TestDemo
//
//  Created by eims on 2018/6/21.
//  Copyright © 2018年 Monster. All rights reserved.
//

#import "RegistViewController.h"
#import "LoginViewController.h"
#import "LZAlertView.h"
#import "ForgetPasswordViewController.h"
@interface RegistViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UITextField *verifyTF;
@property (nonatomic, strong) UITextField *psdTF;
@property (nonatomic, strong) UIButton *agreeBtn;
@end

@implementation RegistViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title  = @"注册";
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = NO;
    // 重置 变为不透明
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
}
-(void)initUI{
    self.view.backgroundColor = RGBCOLOR(255, 255, 255);
    
    UIScrollView *bgScrollV = [[UIScrollView alloc]init];
    [self.view addSubview:bgScrollV];
    if (@available(iOS 11.0, *)) {
        bgScrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    bgScrollV.showsVerticalScrollIndicator = NO;
    [bgScrollV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_offset(0);
    }];
    
    NSString *imageName;
    if (AppDelegateInstance.userType == 1) {
        imageName = @"Theloginbackground1";
    } else {
        imageName = @"Theloginbackground";
    }
    
    UIImageView *topImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    [bgScrollV addSubview:topImgV];
    [topImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_offset(0);
        make.width.mas_equalTo(kScreenWidth);
        make.height.mas_equalTo(kNavBarHeight+Size(328/2));
    }];
    
    UIImageView *headImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"头像"]];
    headImgV.layer.cornerRadius = Size(204/4);
    [bgScrollV addSubview:headImgV];
    [headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgScrollV);
        make.height.width.mas_equalTo(Size(204/2));
        make.top.mas_offset(kNavBarHeight + Size(22/2));
    }];
    
    //手机号
    UIView * phoneBgV = [UIView new];
    phoneBgV.layer.borderColor = RGBACOLOR(153, 153, 153, 0.75).CGColor;
    phoneBgV.layer.borderWidth = 0.5;
    [bgScrollV addSubview:phoneBgV];
    [phoneBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImgV.mas_bottom).mas_offset(Size(40));
        make.left.mas_offset(Size(67/2));
        make.height.mas_equalTo(Size(88/2));
        make.width.mas_equalTo(Size(616/2));
    }];
    
    UIImageView *phoneIconV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mobilephonenumber"]];
    phoneIconV.contentMode = UIViewContentModeScaleAspectFit;
    [phoneBgV addSubview:phoneIconV];
    [phoneIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(phoneBgV);
        make.height.mas_equalTo(Size(38/2));
        make.width.mas_equalTo(Size(28/2));
        make.left.mas_offset(Size(26/2));
    }];
    
    UIView *phoneLine = [UIView new];
    phoneLine.backgroundColor = RGBACOLOR(153, 153, 153, 0.75);
    [phoneBgV addSubview:phoneLine];
    [phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(0.5);
        make.centerY.equalTo(phoneBgV);
        make.height.mas_equalTo(Size(54/2));
        make.left.equalTo(phoneIconV.mas_right).mas_offset(Size(10));
    }];
    
    self.phoneTF = [UITextField ym_textFieldWithFrame:CGRectZero placeholder:@"手机号码" font:Size(15) textColor:COLOR_RGB_51 tag:0];
    self.phoneTF.delegate = self;
    [phoneBgV addSubview:self.phoneTF];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLine.mas_right).mas_offset(Size(11));
        make.top.bottom.right.mas_offset(0);
    }];
    
    //验证码
    UIView * verifyBgV = [UIView new];
    verifyBgV.layer.borderColor = RGBACOLOR(153, 153, 153, 0.75).CGColor;
    verifyBgV.layer.borderWidth = 0.5;
    [bgScrollV addSubview:verifyBgV];
    [verifyBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneBgV.mas_bottom).mas_offset(Size(15));
        make.left.mas_offset(Size(67/2));
        make.height.mas_equalTo(Size(88/2));
        make.width.mas_equalTo(Size(616/2));
    }];
    
    UIImageView *verifyIconV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SMSverificationcode"]];
    verifyIconV.contentMode = UIViewContentModeScaleAspectFit;
    [verifyBgV addSubview:verifyIconV];
    [verifyIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(verifyBgV);
        make.height.mas_equalTo(Size(38/2));
        make.width.mas_equalTo(Size(28/2));
        make.left.mas_offset(Size(26/2));
    }];
    
    UIView *verifyLine = [UIView new];
    verifyLine.backgroundColor = RGBACOLOR(153, 153, 153, 0.75);
    [verifyBgV addSubview:verifyLine];
    [verifyLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(0.5);
        make.centerY.equalTo(verifyBgV);
        make.height.mas_equalTo(Size(54/2));
        make.left.equalTo(verifyIconV.mas_right).mas_offset(Size(10));
    }];
    
    self.verifyTF = [UITextField ym_textFieldWithFrame:CGRectZero placeholder:@"短信验证码" font:Size(15) textColor:COLOR_RGB_51 tag:0];
    self.verifyTF.delegate = self;
    [verifyBgV addSubview:self.verifyTF];
    [self.verifyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(verifyLine.mas_right).mas_offset(Size(11));
        make.top.bottom.mas_offset(0);
        make.width.mas_equalTo(Size(346/2));
    }];
    
    UIButton *verifyBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"发送验证码" backgroundColor:nil titleColor:COLOR_MAIN titleSize:Size(14)];
    [verifyBgV addSubview:verifyBtn];
    [verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-Size(10));
        make.centerY.mas_equalTo(verifyBgV);
    }];
    [verifyBtn addTarget:self action:@selector(doVerifyBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //密码
    UIView * psdBgV = [UIView new];
    psdBgV.layer.borderColor = RGBACOLOR(153, 153, 153, 0.75).CGColor;
    psdBgV.layer.borderWidth = 0.5;
    [bgScrollV addSubview:psdBgV];
    [psdBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(verifyBgV.mas_bottom).mas_offset(Size(15));
        make.left.mas_offset(Size(67/2));
        make.height.mas_equalTo(Size(88/2));
        make.width.mas_equalTo(Size(616/2));
    }];
    
    UIImageView *psdIconV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Pleaseenterpassword"]];
    psdIconV.contentMode = UIViewContentModeScaleAspectFit;
    [psdBgV addSubview:psdIconV];
    [psdIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(psdBgV);
        make.height.mas_equalTo(Size(38/2));
        make.width.mas_equalTo(Size(28/2));
        make.left.mas_offset(Size(26/2));
    }];
    
    UIView *psdLine = [UIView new];
    psdLine.backgroundColor = RGBACOLOR(153, 153, 153, 0.75);
    [psdBgV addSubview:psdLine];
    [psdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(0.5);
        make.centerY.equalTo(psdBgV);
        make.height.mas_equalTo(Size(54/2));
        make.left.equalTo(psdIconV.mas_right).mas_offset(Size(10));
    }];
    
    self.psdTF = [UITextField ym_textFieldWithFrame:CGRectZero placeholder:@"请输入8-16位数字+字母" font:Size(15) textColor:COLOR_RGB_51 tag:0];
    self.psdTF.secureTextEntry = YES;
    self.psdTF.delegate = self;
    [psdBgV addSubview:self.psdTF];
    [self.psdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(psdLine.mas_right).mas_offset(Size(11));
        make.top.bottom.right.mas_offset(0);
    }];
    
    
    
    //注册btn
    UIButton *registBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"注册" backgroundColor:COLOR_MAIN titleColor:COLOR_RGB_51 titleSize:Size(17)];
    registBtn.layer.cornerRadius = Size(98/4);
    [bgScrollV addSubview:registBtn];
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(psdBgV.mas_bottom).mas_offset(Size(100/2));
        make.height.mas_equalTo(Size(98/2));
        make.width.mas_equalTo(Size(616/2));
        make.centerX.equalTo(bgScrollV);
    }];
    [registBtn addTarget:self action:@selector(doRegistBtn) forControlEvents:UIControlEventTouchUpInside];
    
    _agreeBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"已阅读并同意" backgroundColor:nil titleColor:COLOR_RGB_153 titleSize:Size(12)];
   
    [_agreeBtn setImage:[UIImage imageNamed:@"yes"] forState:UIControlStateSelected];
    [_agreeBtn setImage:[UIImage imageNamed:@"no"] forState:UIControlStateNormal];
    [bgScrollV addSubview:_agreeBtn];
    [_agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Size(218/2));
        make.top.equalTo(registBtn.mas_bottom).mas_offset(Size(198/2));
    }];
    [_agreeBtn ym_layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:Size(5)];
    [_agreeBtn addTarget:self action:@selector(doAgreeBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *protocolBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"《注册协议》" backgroundColor:nil titleColor:COLOR_MAIN titleSize:Size(12)];
    [bgScrollV addSubview:protocolBtn];
    [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_agreeBtn.mas_right);
        make.centerY.equalTo(_agreeBtn);
    }];
    [protocolBtn addTarget:self action:@selector(doProtocolBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [bgScrollV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(protocolBtn.mas_bottom).mas_offset(Size(54/2));
    }];
}

#pragma mark - action
-(void)doVerifyBtn:(UIButton *)btn{
    if (self.phoneTF.text.length == 0) {
        [HUD showHUDError:nil title:@"请填写手机号"];
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

-(void)doRegistBtn{
    if (self.phoneTF.text.length == 0) {
        [HUD showHUDError:nil title:@"请填写手机号"];
        return;
    }
    if (self.verifyTF.text.length == 0) {
        [HUD showHUDError:nil title:@"请填写验证码"];
        return;
    }
    if (self.psdTF.text.length == 0) {
        [HUD showHUDError:nil title:@"请填写密码"];
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
        
    
    if (self.agreeBtn.selected == NO) {
        [HUD showHUDError:nil title:@"请先同意注册协议"];
        return;
    }
    
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    [dataDic setValue:self.phoneTF.text forKey:@"phone"];
    [dataDic setValue:self.verifyTF.text forKey:@"code"];
    [dataDic setValue:self.psdTF.text forKey:@"pwd"];
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    [paramDic setValue:[dataDic mj_JSONString] forKey:@"data"];
    
    [[RHNetAPIManager sharedManager]appRegisiterOPT:paramDic].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
        if (data) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    });
}
-(void)doAgreeBtn:(UIButton *)btn{
    btn.selected = !btn.selected;
    [btn ym_layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:Size(5)];
}
-(void)doProtocolBtn{
    
}


-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.phoneTF) {
        if (![NSString ym_validateMobile:textField.text]) {
            [HUD showHUDError:nil title:@"请输入正确手机号"];
        }
    }
    if (textField == self.psdTF) {
        if (self.psdTF.text.length < 8 || self.psdTF.text.length > 16) {
            [HUD showHUDError:nil title:@"请输入8~16位数字+字母"];
            return;
        }
        if ([NSString isAllLetter:self.psdTF.text] || [NSString isAllNumber:self.psdTF.text]) {
            [HUD showHUDError:nil title:@"请输入8~16位数字+字母"];
            return;
        }
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
