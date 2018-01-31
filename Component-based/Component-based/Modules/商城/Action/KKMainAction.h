//
//  KKMainAction.h
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KKMainAction : NSObject

-(UIViewController*)mainViewController;

@end

@interface KKDayPieceAction : NSObject

- (UIViewController*)daypieceViewController;

@end

@interface KKRunPieceAction : NSObject

- (UIViewController*)runpieceViewController;

@end

@interface KKShoppingAction : NSObject

- (UIViewController*)shoppingViewController;

@end


@interface KKMineAction : NSObject

- (UIViewController*)mineViewController;

@end



