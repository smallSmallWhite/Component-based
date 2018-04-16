//
//  Mediator+KKGuidePage.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+KKGuidePage.h"

NSString *const KKGuidePageTarget = @"KKGuidePageAction";
NSString *const KKGuidePageChoice = @"KKGuideAppear";
NSString *const KKGuidePageAppear = @"KKGuideAppearFrom:";

@implementation Mediator (KKGuidePage)
-(void)KKGuidePageChoiceAppear {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:KKGuidePageTarget actionName:KKGuidePageChoice];
    [self performWithOptions:options];
}

-(void)KKGuidePageAppear:(UIViewController *)controller {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:KKGuidePageTarget actionName:KKGuidePageAppear];
    options.parameters = @{@"Controller":controller};
    [self performWithOptions:options];
}

@end
