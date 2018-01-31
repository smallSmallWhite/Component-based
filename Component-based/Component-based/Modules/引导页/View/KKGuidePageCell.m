//
//  KKGuidePageCell.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KKGuidePageCell.h"

@interface KKGuidePageCell ()

@property (nonatomic,weak) UIImageView *imageView;

@end

@implementation KKGuidePageCell

-(void)layoutSubviews {
    
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}
-(void)setImage:(UIImage *)image {
    
    _image = image;
    self.imageView.image = image;
}

#pragma mark ==================getters and setters==================
-(UIImageView *)imageView {
    
    if (!_imageView) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        _imageView = imageV;
        [self.contentView addSubview:imageV];
    }
    return _imageView;
}

@end
