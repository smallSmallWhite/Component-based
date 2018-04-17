//
//  UITextField+Placeholder.h
//  ownerCarSide
//
//  Created by mac on 2017/7/27.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Placeholder)

+ (void)setPlaceHolerTextColor:(UIColor *)placeHolderColor
        AndPlaceholderFontSize:(CGFloat)placeholerSize
               AndTextFontSize:(CGFloat)textFontSize
                  AndTextColor:(UIColor *)textColor
                 WithTextField:(UITextField *)textFild;

@end
