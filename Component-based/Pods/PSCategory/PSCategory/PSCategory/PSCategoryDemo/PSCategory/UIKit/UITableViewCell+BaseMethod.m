//
//  UITableViewCell+BaseMethod.m
//  ownerCarSide
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UITableViewCell+BaseMethod.h"
#import "PSHeader.h"

@implementation UITableViewCell (BaseMethod)

#pragma mark - ScaleSize

//说明一下我是以6sPlus为设计基准的，所以是除以414和736 的 ，你们以哪个屏幕大小设计的，就除以哪个屏幕的宽高。
//相信里边的计算公式都能看懂吧（不懂的转行吧。。。）
//想要字体的自适应用下边的任何一个方法都行
//其实不止的字体的适应，以前计算位置、大小的数子都可以用这个来转换（具体怎么用后边会说）
- (CGFloat)autoScaleW:(CGFloat)w{
    
    return w * (screenW / 375.0f);
    
}
- (CGFloat)autoScaleH:(CGFloat)h{
    
    return h * (screenH / 667.0f);
}
@end
