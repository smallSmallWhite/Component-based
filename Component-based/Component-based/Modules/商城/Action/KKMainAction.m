//
//  KKMainAction.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KKMainAction.h"
#import "MallViewController.h"
#import "RunPiecesViewController.h"
#import "DaypieceViewController.h"
#import "ShoppingViewController.h"
#import "MineViewController.h"


@implementation KKMainAction

-(UIViewController *)mainViewController {
    
    return [[MallViewController alloc] init];
}
@end

@implementation KKDayPieceAction

-(UIViewController *)daypieceViewController {
    
    return [[DaypieceViewController alloc] init];
}
@end

@implementation KKRunPieceAction

-(UIViewController *)runpieceViewController {
    
    return [[RunPiecesViewController alloc] init];
}
@end

@implementation KKShoppingAction

-(UIViewController *)shoppingViewController {
    
    return [[ShoppingViewController alloc] init];
}
@end

@implementation KKMineAction

-(UIViewController *)mineViewController {
    
    return [[MineViewController alloc] init];
}
@end


