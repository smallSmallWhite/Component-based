//
//  PSLoginTopView.h
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PSLoginTopViewDelegate <NSObject>

- (void)clickBackAction:(UIButton *)sender;

@end

@interface PSLoginTopView : UIView

//添加白色返回按钮 注册时需要使用
@property (nonatomic,strong) UIButton *returnImageView;
@property (nonatomic,weak) id <PSLoginTopViewDelegate>delegate;

@end
