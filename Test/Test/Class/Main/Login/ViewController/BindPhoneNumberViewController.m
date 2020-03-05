//
//  BindPhoneNumberViewController.m
//  Test
//
//  Created by eims on 2018/10/31.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "BindPhoneNumberViewController.h"

@interface BindPhoneNumberViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UITextField *verifyTF;
@end

@implementation BindPhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手机号绑定";
    
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
    
    UIButton *confirmBtn = [UIButton ym_ButtonWithFrame:CGRectZero title:@"确定" backgroundColor:COLOR_MAIN titleColor:COLOR_RGB_51 titleSize:Size(17)];
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(verifyBgV.mas_bottom).mas_offset(Size(90/2));
        make.width.mas_equalTo(Size(690/2));
        make.height.mas_equalTo(Size(98/2));
        make.centerX.equalTo(self.view);
    }];
    [confirmBtn addTarget:self action:@selector(doConfirmBtn) forControlEvents:UIControlEventTouchUpInside];
}

-(void)doVerifyBtn:(UIButton *)btn{
    [self.view endEditing:YES];
    
    if (self.phoneTF.text.length == 0) {
        [HUD showHUDSuccess:nil title:@"请输入手机号"];
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
-(void)doConfirmBtn{
    [self.view endEditing:YES];
    
    if (self.phoneTF.text.length == 0) {
        [HUD showHUDSuccess:nil title:@"请输入手机号"];
        return;
    }
    if (self.verifyTF.text.length == 0) {
        [HUD showHUDSuccess:nil title:@"请输入验证码"];
        return;
    }
    
    if (self.thirdBindDic) {
        NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
        [dataDic setValue:self.phoneTF.text forKey:@"phone"];
        [dataDic setValue:self.verifyTF.text forKey:@"code"];
        [dataDic setValue:self.thirdBindDic[@"type"] forKey:@"type"];
        [dataDic setValue:self.thirdBindDic[@"oppenId"] forKey:@"oppenId"];
        [dataDic setValue:self.thirdBindDic[@"headimgurl"] forKey:@"headimgurl"];
        [dataDic setValue:self.thirdBindDic[@"nickname"] forKey:@"nickname"];
        [dataDic setValue:self.thirdBindDic[@"status"] forKey:@"status"];
        
        NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
        [paramDic setValue:[dataDic mj_JSONString] forKey:@"data"];
        
        [[RHNetAPIManager sharedManager]appThirdBindingOPT:paramDic].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
            if (data) {
                BLOCK_EXEC(self.bindSuccessBlock,data, msg, code);
                
            }
        });
    }else{
        NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
        [dataDic setValue:self.phoneTF.text forKey:@"phone"];
        [dataDic setValue:self.verifyTF.text forKey:@"code"];
        
        NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
        [paramDic setValue:[dataDic mj_JSONString] forKey:@"data"];
        [paramDic setValue:AppDelegateInstance.token forKey:@"token"];
        
        [[RHNetAPIManager sharedManager]appChangePhoneOPT:paramDic].start(^(id data, NSString *msg, NSInteger code, NSError *error) {
            if (data) {
                [HUD showHUDSuccess:nil title:@"绑定成功"];
                
            }
        });
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
