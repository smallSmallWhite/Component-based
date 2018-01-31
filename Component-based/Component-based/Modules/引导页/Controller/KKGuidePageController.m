//
//  KKGuidePageController.m
//  Component-based
//
//  Created by mac on 2018/1/30.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KKGuidePageController.h"
#import "KKGuidePageCell.h"
#import "Common.h"

@interface KKGuidePageController ()

@property(nonatomic,strong)UIPageControl *control;

@end

@implementation KKGuidePageController

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
    
    [self.collectionView registerClass:[KKGuidePageCell class] forCellWithReuseIdentifier:ID];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self setUpPageControl];
}
- (void)setUpPageControl
{
    UIPageControl *control = [[UIPageControl alloc] init];
    control.numberOfPages = 4;
    control.pageIndicatorTintColor = [UIColor grayColor];
    control.currentPageIndicatorTintColor = kBlueColor;
    control.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - 40, CGRectGetWidth(self.view.frame), 20);
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
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KKGuidePageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"引导页-%ld",(unsigned long)indexPath.row + 1];
    cell.image = [UIImage imageNamed:imageName];
    
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 3) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



@end
