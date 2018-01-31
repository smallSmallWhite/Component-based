//
//  Mediator+RunPiece.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+RunPiece.h"

NSString *const KKRunPieceAction = @"KKRunPieceAction";
NSString *const KKRunpieceViewController = @"runpieceViewController";

@implementation Mediator (RunPiece)

-(UIViewController *)KKMain_runPieceViewController {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:KKRunPieceAction actionName:KKRunpieceViewController];
    return  [self performWithOptions:options];
}


@end
