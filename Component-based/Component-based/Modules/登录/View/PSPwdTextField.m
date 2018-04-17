//
//  PSPwdTextField.m
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSPwdTextField.h"
#import "Public.h"

@interface PSPwdTextField ()



@end

@implementation PSPwdTextField

-(instancetype)init {
    
    self = [super init];
    if (self) {
        
        [UITextField setPlaceHolerTextColor:kTextFieldPlaceholderTextColor AndPlaceholderFontSize:[self autoScaleW:15] AndTextFontSize:[self autoScaleW:15] AndTextColor:kTextFieldTextColor WithTextField:self];
        self.secureTextEntry = YES;
    }
    return self;
}

@end
