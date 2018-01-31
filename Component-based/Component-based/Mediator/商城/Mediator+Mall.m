//
//  Mediator+Mall.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+Mall.h"

NSString *const KKMainAction = @"KKMainAction";
NSString *const KKMainActionViewController = @"mainViewController";

@implementation Mediator (Mall)

-(UIViewController *)KKMain_mainViewController {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:KKMainAction actionName:KKMainActionViewController];
   return  [self performWithOptions:options];
}



@end
