//
//  KKGuidePageAction.h
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KKGuidePageAction : NSObject
//判断是否需要出现引导页
- (id)KKGuideAppear;
//引导页跳转的页面
- (id)KKGuideAppearFrom:(NSDictionary <UIViewController*,id>*)controller;
@end
