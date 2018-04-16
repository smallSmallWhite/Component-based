//
//  KKGuidePageCell.h
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PSGuidePageCellDelegate <NSObject>

- (void)jumpBtnAction;

@end

@interface PSGuidePageCell : UICollectionViewCell
@property (nonatomic, strong) UIImage *image;
@property (nonatomic,weak) id <PSGuidePageCellDelegate>delegate;
- (void)setCellWithIndex:(NSInteger)index;
@end
