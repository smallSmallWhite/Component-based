//
//  PSTools.m
//  Component-based
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSTools.h"

@implementation PSTools
//验证手机号合法性
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186,176
     * 电信：133,1349,153,180,189,170,171
     */
    //
    NSString * MOBILE = @"^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,1,3,5-8])|(18[0-9])|(147))\\d{8}$";
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,177,180,189
     22         */
    NSString * CT = @"^1((33|53|77|8[09])[0-9]|349)\\d{7}$";
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    NSString *mobile = mobileNum;
    if ([mobileNum containsString:@"-"]) {
        
        mobile = [mobileNum stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    if (mobile.length == 11) {
        
        //手机号码
        if(([regextestmobile evaluateWithObject:mobile] == YES)
           || ([regextestcm evaluateWithObject:mobile] == YES)
           || ([regextestct evaluateWithObject:mobile] == YES)
           || ([regextestcu evaluateWithObject:mobile] == YES)){
            return YES;
        }else{
            return NO;
        }
    }else{
        
        if (mobile.length > 11) {
            
            //既不是手机号，也不是电话号
            return NO;
        }else{
            
            if (([regextestPHS evaluateWithObject:mobile] == YES)) {
                
                //是电话号
                return YES;
            }else{
                
                //不是电话号
                return NO;
            }
        }
    }
    
}


@end
