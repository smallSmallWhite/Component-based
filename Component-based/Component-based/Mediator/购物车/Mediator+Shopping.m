//
//  Mediator+Shopping.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "Mediator+Shopping.h"

NSString *const KKShoppingAction = @"KKShoppingAction";
NSString *const KKShoppingViewController = @"shoppingViewController";

@implementation Mediator (Shopping)

-(UIViewController *)KKMain_shoppingViewController {
    
    MediatorOptions *options = [MediatorOptions optionsWithTargetName:KKShoppingAction actionName:KKShoppingViewController];
    return  [self performWithOptions:options];
}


@end
