//
//  BondPhoneController.m
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "BondPhoneController.h"
#import "Public.h"
#import "BondPhoneView.h"

@interface BondPhoneController ()<BondPhoneViewDelegate>

//绑定手机View
@property (nonatomic,strong) BondPhoneView *bondView;

@end

@implementation BondPhoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏设置
    [self setNavi];
    //添加绑定手机View
    [self addBondView];
    //添加监听
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
    
    self.navigationItem.title = @"绑定手机";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"login_return"] style:(UIBarButtonItemStylePlain) target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = leftItem;
}
#pragma mark ==================添加绑定手机View==================
- (void)addBondView {
    
    [self.view addSubview:self.bondView];
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
        
        if ([PSTools isMobileNumber:self.bondView.accountTF.text]) {
            
            //手机号输入正确
            [self.bondView.verifyCodeBtn setBackgroundColor:kThemeColor];
            [self.bondView.verifyCodeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
            self.bondView.verifyCodeBtn.userInteractionEnabled = YES;
            
        }else{
            
            //手机号输入错误
            [self.bondView.verifyCodeBtn setBackgroundColor:kBtnNormalColor];
            [self.bondView.verifyCodeBtn setTitleColor:UIColorFromRGBValue(0x333333) forState:(UIControlStateNormal)];
            self.bondView.verifyCodeBtn.userInteractionEnabled = NO;
        }
    }
    
    //判断输入的内容是否为空
    if ([PSTools isMobileNumber:self.bondView.accountTF.text] && ![self.bondView.verifyTF.text isEqualToString:@""]) {
        
        //输入内容不为空
        [self.bondView.registerBtn setBackgroundColor:kThemeColor];
        [self.bondView.registerBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        self.bondView.registerBtn.userInteractionEnabled = YES;
        
    }else{
        
        //输入内容为空
        [self.bondView.registerBtn setBackgroundColor:kBtnNormalColor];
        [self.bondView.registerBtn setTitleColor:UIColorFromRGBValue(0x333333) forState:(UIControlStateNormal)];
        self.bondView.registerBtn.userInteractionEnabled = NO;
    }
}
- (void)timeOut:(NSNotification *)sender{
    
    [self.bondView.verifyCodeBtn setBackgroundColor:kThemeColor];
    [self.bondView.verifyCodeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    self.bondView.verifyCodeBtn.userInteractionEnabled = YES;
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
-(BondPhoneView *)bondView {
    
    if (!_bondView) {
        
        _bondView = [[BondPhoneView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, screenW, screenH - kNavigationBarHeight)];
        _bondView.delegate = self;
        _bondView.backgroundColor = kControllerBackgroundColor;
    }
    return _bondView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
