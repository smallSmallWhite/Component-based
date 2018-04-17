//
//  UITextField+Placeholder.m
//  ownerCarSide
//
//  Created by mac on 2017/7/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UITextField+Placeholder.h"

@implementation UITextField (Placeholder)
//设置输入框的占位字符的颜色和字体 以及输入框的字体和颜色
+(void)setPlaceHolerTextColor:(UIColor *)placeHolderColor AndPlaceholderFontSize:(CGFloat)placeholerSize AndTextFontSize:(CGFloat)textFontSize AndTextColor:(UIColor *)textColor WithTextField:(UITextField *)textFild {
    
    [textFild setFont:[UIFont systemFontOfSize:textFontSize]];
    textFild.textColor = textColor;
    [textFild setValue:placeHolderColor
                    forKeyPath:@"_placeholderLabel.textColor"];
    [textFild setValue:[UIFont systemFontOfSize:placeholerSize] forKeyPath:@"_placeholderLabel.font"];
    
}


@end
