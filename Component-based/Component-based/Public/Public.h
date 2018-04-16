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


//判断是否是iphoneX
#define kIs_iPhoneX (screenW == 375.f && screenH == 812.f)
//状态栏的高度
#define kStatusBarHeight  (kIs_iPhoneX ? 44.f : 20.f)

#endif /* Public_h */
