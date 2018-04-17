//
//  PSLoginTopView.m
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSLoginTopView.h"
#import "Public.h"

@interface PSLoginTopView ()

//背景图片
@property (nonatomic,strong) UIImageView *backImageView;
//logo图片
@property (nonatomic,strong) UIImageView *logoImageView;

@end

@implementation PSLoginTopView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //UI相关设置
        [self setBaseUI];
        //布局相关
        [self layOutViews];
    }
    return self;
}
#pragma mark ==================UI相关设置==================
- (void)setBaseUI {
    
    [self addSubview:self.backImageView];
    [self.backImageView addSubview:self.logoImageView];
}
#pragma mark ==================布局相关==================
- (void)layOutViews {
    
    //添加返回按钮
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, kStatusBarHeight, screenW, 44)];
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    
    [view addSubview:self.returnImageView];
    _returnImageView.frame = CGRectMake(4, 14 + kStatusBarHeight, 80, 17);
    [self.returnImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(view).offset(4);
        make.width.equalTo(80);
        make.height.equalTo(17);
        make.centerY.equalTo(view).offset(0);
    }];
    
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.trailing.equalTo(self).offset(0);
        make.height.equalTo([self autoScaleH:261]);
    }];
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.backImageView).offset(10 + kNavigationBarHeight);
        make.width.height.equalTo([self autoScaleW:88]);
        make.centerX.equalTo(self.backImageView).offset(0);
    }];
}
#pragma mark ==================点击事件==================
- (void)clickAction:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickBackAction:)]) {
        
        [self.delegate clickBackAction:sender];
    }
}
#pragma mark ==================懒加载==================
-(UIImageView *)backImageView {
    
    if (!_backImageView) {
        
        _backImageView = [[UIImageView alloc] init];
        _backImageView.image = [UIImage imageNamed:@"login_background"];
        _backImageView.clipsToBounds = YES;
        _backImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backImageView;
}
-(UIImageView *)logoImageView {
    
    if (!_logoImageView) {
        
        _logoImageView = [[UIImageView alloc] init];
        _logoImageView.image = [UIImage imageNamed:@"login_icon"];
        _logoImageView.clipsToBounds = YES;
        _logoImageView.layer.cornerRadius = 5;
        _logoImageView.layer.masksToBounds = YES;
        _logoImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _logoImageView;
}
-(UIButton *)returnImageView {
    
    if (!_returnImageView) {
        
        _returnImageView = [UIButton buttonWithType:UIButtonTypeCustom];
        [_returnImageView setImage:[UIImage imageNamed:@"register_return"] forState:(UIControlStateNormal)];
        _returnImageView.imageEdgeInsets = UIEdgeInsetsMake(0, -55, 0, 0);
        [_returnImageView addTarget:self action:@selector(clickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _returnImageView;
}

@end
