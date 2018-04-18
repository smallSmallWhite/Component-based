//
//  ForgetPwdViewController.m
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ForgetPwdViewController.h"
#import "Public.h"
#import "PSForgetPwdView.h"

@interface ForgetPwdViewController ()<PSForgetPwdViewDelegate>

//忘记密码View
@property (nonatomic,strong) PSForgetPwdView *forgetPwdView;

@end

@implementation ForgetPwdViewController

#pragma mark ==================视图生命周期==================
- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏相关设置
    [self setNavi];
    //添加忘记密码View
    [self addView];
    //添加监听事件
    [self addListenser];
}
#pragma mark ==================导航栏相关设置==================
- (void)setNavi {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGBValue(0x333333),NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    self.navigationController.navigationBar.tintColor = UIColorFromRGBValue(0x333333);
    [[UINavigationBar appearance]  setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    self.navigationItem.title = @"忘记密码";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"login_return"] style:(UIBarButtonItemStylePlain) target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = leftItem;
}
#pragma mark ==================添加监听事件==================
- (void)addListenser{
    
    //监听textField回调事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    //倒计时完成时的回调
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timeOut:) name:@"timeIsOut" object:nil];
}
#pragma mark ==================监听回调==================
- (void)textDidChanged:(NSNotification *)notification {
    
    //判断手机号是否输入正确
    if ([notification.object isKindOfClass:[PSAccountTextField class]]) {
        
        if ([PSTools isMobileNumber:self.forgetPwdView.accountTF.text]) {
            
            //手机号输入正确
            [self.forgetPwdView.verifyCodeBtn setBackgroundColor:kThemeColor];
            [self.forgetPwdView.verifyCodeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
            self.forgetPwdView.verifyCodeBtn.userInteractionEnabled = YES;
            
        }else{
            
            //手机号输入错误
            [self.forgetPwdView.verifyCodeBtn setBackgroundColor:kBtnNormalColor];
            [self.forgetPwdView.verifyCodeBtn setTitleColor:UIColorFromRGBValue(0x333333) forState:(UIControlStateNormal)];
            self.forgetPwdView.verifyCodeBtn.userInteractionEnabled = NO;
        }
    }
    
    //判断输入的内容是否为空
    if ([PSTools isMobileNumber:self.forgetPwdView.accountTF.text] && ![self.forgetPwdView.verifyTF.text isEqualToString:@""] && ![self.forgetPwdView.pwdTF.text isEqualToString:@""]) {
        
        //输入内容不为空
        [self.forgetPwdView.registerBtn setBackgroundColor:kThemeColor];
        [self.forgetPwdView.registerBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        self.forgetPwdView.registerBtn.userInteractionEnabled = YES;
        
    }else{
        
        //输入内容为空
        [self.forgetPwdView.registerBtn setBackgroundColor:kBtnNormalColor];
        [self.forgetPwdView.registerBtn setTitleColor:UIColorFromRGBValue(0x333333) forState:(UIControlStateNormal)];
        self.forgetPwdView.registerBtn.userInteractionEnabled = NO;
    }
}
- (void)timeOut:(NSNotification *)sender{
    
    [self.forgetPwdView.verifyCodeBtn setBackgroundColor:kThemeColor];
    [self.forgetPwdView.verifyCodeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    self.forgetPwdView.verifyCodeBtn.userInteractionEnabled = YES;
}
#pragma mark ==================添加忘记密码View==================
- (void)addView {
    
    [self.view addSubview:self.forgetPwdView];
}
#pragma mark ==================导航栏点击事件==================
- (void)backAction:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark ==================协议代理==================
-(void)clickRegisterAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case 5000:
        {
            //点击发送验证码按钮
            sender.countDownFormat= @"%d秒后重试";
            [sender countDownWithTimeInterval:60];
            [sender setTitleColor:UIColorFromRGBValue(0x333333) forState:(UIControlStateNormal)];
            [sender setBackgroundColor:kBtnNormalColor];
            sender.userInteractionEnabled = NO;
        }
            break;
        case 5001:
        {
            [HUD showMessage:@"点击完成按钮"];
        }
            break;
        default:
            break;
    }
}
#pragma mark ==================移除通知==================
-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark ==================懒加载==================
-(PSForgetPwdView *)forgetPwdView {
    
    if (!_forgetPwdView) {
        
        _forgetPwdView = [[PSForgetPwdView alloc] initWithFrame:CGRectMake(0, 64, screenW, screenH - kNavigationBarHeight)];
        _forgetPwdView.delegate = self;
        _forgetPwdView.backgroundColor = kControllerBackgroundColor;
    }
    return _forgetPwdView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
