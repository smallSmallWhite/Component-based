//
//  Mediator+Mine.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+Mine.h"

NSString *const KKMineAction = @"KKMineAction";
NSString *const KKMineViewController = @"mineViewController";

@implementation Mediator (Mine)

-(UIViewController *)KKMain_mineViewController {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:KKMineAction actionName:KKMineViewController];
    return  [self performWithOptions:options];
}



@end
