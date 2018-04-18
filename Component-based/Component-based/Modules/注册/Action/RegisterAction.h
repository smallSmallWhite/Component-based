//
//  RegisterAction.h
//  Component-based
//
//  Created by mac on 2018/4/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RegisterAction : NSObject

- (UIViewController *)registerController:(NSDictionary<NSString *,id>*)parameters;

@end
