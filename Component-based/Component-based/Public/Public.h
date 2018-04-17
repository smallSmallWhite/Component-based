//
//  Public.h
//  Component-based
//
//  Created by mac on 2018/4/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#ifndef Public_h
#define Public_h

//------------------------项目中用到的宏定义---------------------
//屏幕宽和高
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

//十六进制颜色
#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//RGB颜色
//透明度不可调
#define kRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
//透明度可调
#define kRGB_alpha(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//判断是否是iphoneX
#define kIs_iPhoneX (screenW == 375.f && screenH == 812.f)
///导航栏的高度
#define kNavigationBarHeight (kIs_iPhoneX ? 88.f : 64.f)
//状态栏的高度
#define kStatusBarHeight  (kIs_iPhoneX ? 44.f : 20.f)

//下划线的颜色
#define kUnderlineColor UIColorFromRGBValue(0xdddddd)
//输入框占位字符的颜色
#define kTextFieldPlaceholderTextColor UIColorFromRGBValue(0x999999)
//输入框内容的颜色
#define kTextFieldTextColor UIColorFromRGBValue(0x333333)
//主体颜色
#define kThemeColor UIColorFromRGBValue(0xfd7673)
//按钮没有选中的呀呢
#define kBtnNormalColor UIColorFromRGBValue(0xdddddd)

//存储用户相关的数据的头文件
#import "UserCenter.h"
//代码布局第三方
#import <SDAutoLayout.h>
// 定义这个常量,就可以在使用Masonry不必总带着前缀 `mas_`:
#define MAS_SHORTHAND
// 定义这个常量,以支持在 Masonry 语法中自动将基本类型转换为 object 类型:
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
//键盘相关
#import <IQKeyboardManager.h>
#import <PSPrefixHeader.h>
//加载框提示文字
#import "HUD.h"


#endif /* Public_h */
