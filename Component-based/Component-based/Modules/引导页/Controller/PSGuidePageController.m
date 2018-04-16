//
//  KKGuidePageController.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "PSGuidePageController.h"
#import "PSGuidePageCell.h"
#import "Public.h"
#import "Common.h"

//引导页的个数
#define kUserGuidePageNumber  3
@interface PSGuidePageController ()<PSGuidePageCellDelegate>

@property(nonatomic,strong)UIPageControl *control;

@end

@implementation PSGuidePageController

static NSString * const reuseIdentifier = @"Cell";

static NSString *ID = @"cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[PSGuidePageCell class] forCellWithReuseIdentifier:ID];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self setUpPageControl];
}
- (void)setUpPageControl
{
    CGFloat height = 0.0;
    if (kIs_iPhoneX) {
        
        height = screenH - 40 - 34;
    }else{
        height = screenH - 40;
    }
    UIPageControl *control = [[UIPageControl alloc] init];
    control.numberOfPages = kUserGuidePageNumber;
    control.pageIndicatorTintColor = [UIColor grayColor];
    control.currentPageIndicatorTintColor = kRedColor;
    control.frame = CGRectMake(0, height, CGRectGetWidth(self.view.frame), 20);
    _control = control;
    [_control addTarget:self action:@selector(ChagePage:) forControlEvents:UIControlEventValueChanged];
     [self.view addSubview:control];
}
-(void)ChagePage:(UIPageControl*)PageControl{
    NSInteger index = PageControl.currentPage;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]    atScrollPosition:0 animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    _control.currentPage = page;
}
#pragma mark ==================UICollectionViewDelegate==================
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return kUserGuidePageNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PSGuidePageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    NSString *imageName = @"";
    if (kIs_iPhoneX) {
        
        imageName = [NSString stringWithFormat:@"UserGuide_X%ld",(unsigned long)indexPath.row + 1];
        
    }else{
        
        imageName = [NSString stringWithFormat:@"UserGuide_small%ld",(unsigned long)indexPath.row + 1];
    }
    [cell setCellWithIndex:indexPath.row];
    cell.delegate = self;
    cell.image = [UIImage imageNamed:imageName];
    
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == kUserGuidePageNumber - 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
#pragma mark ==================协议代理==================
-(void)jumpBtnAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
