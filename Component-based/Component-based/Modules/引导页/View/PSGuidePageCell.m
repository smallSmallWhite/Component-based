//
//  KKGuidePageCell.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSGuidePageCell.h"
#import "Public.h"

@interface PSGuidePageCell ()

@property (nonatomic,weak) UIImageView *imageView;
//跳过
@property (nonatomic,strong) UIButton *jumpBtn;
//创建定时器
@property (nonatomic,strong) NSTimer *timer;
//定时器显示的时间
@property (nonatomic,assign) NSInteger showTime;
@end

@implementation PSGuidePageCell

-(void)layoutSubviews {
    
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}
-(void)setImage:(UIImage *)image {
    
    _image = image;
    self.imageView.image = image;
}
-(void)setCellWithIndex:(NSInteger)index {
    
    _showTime = 5;
    if (index == 2) {
        
        [self.imageView addSubview:self.jumpBtn];
        //创建定时器
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    }
}
#pragma mark ==================定时器回调==================
- (void)timeAction {
    
    _showTime = _showTime - 1;
    if (_showTime >= 0) {
        
        [self.jumpBtn setTitle:[NSString stringWithFormat:@"%lds 跳过",_showTime] forState:(UIControlStateNormal)];
    }
    if (_showTime == 0) {
        
        self.timer = nil;
        [self.timer invalidate];
        if (self.delegate && [self.delegate respondsToSelector:@selector(jumpBtnAction)]) {
            
            [self.delegate jumpBtnAction];
        }
    }
}
#pragma mark ==================点击事件回调==================
- (void)jumpAction:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(jumpBtnAction)]) {
        
        [self.delegate jumpBtnAction];
    }
}
#pragma mark ==================getters and setters==================
-(UIImageView *)imageView {
    
    if (!_imageView) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.clipsToBounds = YES;
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView = imageV;
        [self.contentView addSubview:imageV];
    }
    return _imageView;
}
-(UIButton *)jumpBtn {
    
    if (!_jumpBtn) {
        
        _jumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_jumpBtn setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4]];
        [_jumpBtn setTitle:[NSString stringWithFormat:@"%lds 跳过",_showTime] forState:(UIControlStateNormal)];
        [_jumpBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _jumpBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _jumpBtn.frame = CGRectMake(screenW - 20  - 60, kStatusBarHeight, 60, 28);
        [_jumpBtn addTarget:self action:@selector(jumpAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _jumpBtn.layer.cornerRadius = 14;
        _jumpBtn.layer.masksToBounds = YES;
    }
    return _jumpBtn;
}


@end
