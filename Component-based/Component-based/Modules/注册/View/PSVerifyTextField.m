//
//  PSVerifyTextField.m
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSVerifyTextField.h"
#import "Public.h"

@interface PSVerifyTextField ()<UITextFieldDelegate>



@end

@implementation PSVerifyTextField

-(instancetype)init {
    
    self = [super init];
    if (self) {
        
        [UITextField setPlaceHolerTextColor:kTextFieldPlaceholderTextColor AndPlaceholderFontSize:[self autoScaleW:15] AndTextFontSize:[self autoScaleW:15] AndTextColor:kTextFieldTextColor WithTextField:self];
        //设置键盘类型
        self.keyboardType = UIKeyboardTypePhonePad;
        self.delegate = self;
    }
    return self;
}
#pragma mark ==================UITextField代理方法==================
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{  //string就是此时输入的那个字符textField就是此时正在输入的那个输入框返回YES就是可以改变输入框的值NO相反
    
    if ([string isEqualToString:@"\n"])  //按回车键可以改变
    {
        return YES;
    }
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
    //验证码输入限制6位
    if ([toBeString length] > 6) {
        //如果大于6，则禁止输入
        textField.text = [toBeString substringToIndex:6];
        return NO;
    }
    return YES;
}

@end
