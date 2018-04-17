//
//  UILabel+Font.m
//  ownerCarSide
//
//  Created by mac on 2017/7/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UILabel+Font.h"


@implementation UILabel (Font)

+ (void)setLabelTextColor:(UIColor *)textColor AndFontSize:(CGFloat)fontSize WithLabel:(UILabel *)label {
    
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    
}

@end
