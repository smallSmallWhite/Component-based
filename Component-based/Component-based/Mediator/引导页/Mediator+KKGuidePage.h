//
//  Mediator+KKGuidePage.h
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator.h"

@interface Mediator (KKGuidePage)

/**
 是否展示引导页
 */
- (void)KKGuidePageChoiceAppear;

/**
 从制定的控制器进入到引导页
 */
- (void)KKGuidePageAppear:(UIViewController *)controller;


@end
