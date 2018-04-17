//
//  UIButton+Font.m
//  ownerCarSide
//
//  Created by mac on 2017/7/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UIButton+Font.h"

@implementation UIButton (Font)

+(void)setBtnTextColor:(UIColor *)btnColor AndFontSize:(CGFloat)fontSize WithBtn:(UIButton *)button {
    
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button setTitleColor:btnColor forState:UIControlStateNormal];
}

@end
