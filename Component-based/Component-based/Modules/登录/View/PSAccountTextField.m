//
//  PSAccountTextField.m
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSAccountTextField.h"
#import "Public.h"

@interface  PSAccountTextField ()<UITextFieldDelegate>



@end

@implementation PSAccountTextField

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
    //手机号输入限制11位
    if ([toBeString length] > 11) {
        //如果大于11，则禁止输入
        textField.text = [toBeString substringToIndex:11];
        return NO;
    }
    return YES;
}

@end
