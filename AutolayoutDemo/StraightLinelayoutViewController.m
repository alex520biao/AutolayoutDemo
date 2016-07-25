//
//  LinelayoutViewController.m
//  AutolayoutDemo
//
//  Created by alex520biao on 15/7/2.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "StraightLinelayoutViewController.h"
#import "LineLayoutView.h"
#import "AutoLayout.h"

@interface StraightLinelayoutViewController ()

@property (nonatomic,strong)LineLayoutView *lineLayoutView;

@end



@implementation StraightLinelayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LineLayoutView *lineLayoutView = [[LineLayoutView alloc] initWithFrame:CGRectMake(20, 80, 280, 300)];
    [self.view addSubview:lineLayoutView];
    self.lineLayoutView = lineLayoutView;
    lineLayoutView.backgroundColor = [UIColor redColor];
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
    self.lineLayoutView.height = 400;
}


@end
