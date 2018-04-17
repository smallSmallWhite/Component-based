//
//  PSThirdLoginView.h
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PSThirdLoginViewDelegate <NSObject>

- (void)clickThirdLoginBtnAction:(UIButton *)sender;

@end

@interface PSThirdLoginView : UIView

@property (nonatomic,weak) id <PSThirdLoginViewDelegate>delegate;

@end
