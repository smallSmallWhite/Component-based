//
//  Mediator+DayPiece.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+DayPiece.h"

NSString *const KKDayPieceAction = @"KKDayPieceAction";
NSString *const KKDaypieceViewController = @"daypieceViewController";

@implementation Mediator (DayPiece)

-(UIViewController *)KKMain_dayPieceViewController {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:KKDayPieceAction actionName:KKDaypieceViewController];
    return  [self performWithOptions:options];
}


@end
