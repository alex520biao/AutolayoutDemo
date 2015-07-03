//
//  FoldLinelayoutViewController.m
//  AutolayoutDemo
//
//  Created by liubiao on 15/7/2.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "FoldLinelayoutViewController.h"
#import "FreeLayoutView.h"
#import "AutoLayout.h"

@interface FoldLinelayoutViewController ()
@property (nonatomic,strong)FreeLayoutView *freeLayoutView;

@end


@implementation FoldLinelayoutViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    FreeLayoutView *freeLayoutView = [[FreeLayoutView alloc] initWithFrame:CGRectMake(20, 80, 280, 300)];
    [self.view addSubview:freeLayoutView];
    self.freeLayoutView = freeLayoutView;
    freeLayoutView.backgroundColor = [UIColor redColor];
}

#pragma mark - layoutSubviews 子视图布局
/*!
 *  @brief  将开始子视图布局
 */
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
}

/*!
 *  @brief  子视图布局
 *  @note   只能有子视图布局代码,严禁干其他任何事情。viewDidLayoutSubviews中不能修改self.view.frame
 */
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //线性布局
    self.freeLayoutView.insets = UIEdgeInsetsMake(20, 20, 20, 20);
    self.freeLayoutView.height = 400;
}



@end
