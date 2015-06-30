//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by alex on 15/6/25.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+AutoResize.h"
#import "UIView+LinearLayout.h"
#import "UIViewAdditions.h"
#import "UIView+FreeLayout.h"

#import "LineLayoutView.h"

#import "FreeLayoutView.h"

@interface ViewController ()

@property (nonatomic,strong)UILabel *lab1;
@property (nonatomic,strong)UILabel *lab2;
@property (nonatomic,strong)UILabel *lab3;
@property (nonatomic,strong)UILabel *lab4;

@property (nonatomic,strong)UILabel *lab5;
@property (nonatomic,strong)UILabel *lab6;
@property (nonatomic,strong)UILabel *lab7;

@property (nonatomic,strong)UILabel *lab8;
@property (nonatomic,strong)UILabel *lab9;
@property (nonatomic,strong)UILabel *lab10;
@property (nonatomic,strong)UILabel *lab11;
@property (nonatomic,strong)UILabel *lab12;


@property (nonatomic,strong)FreeLayoutView *freeLayoutView;
@property (nonatomic,strong)LineLayoutView *lineLayoutView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"1水费电费税费省电费省电费爽肤水";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab1 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"2水费电费税费省电费省电费爽肤水";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab2 = lab;
    }
    
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"3水费电费税费省电费省电费爽肤水";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab3 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"4 苹果";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab4 = lab;
    }
    
    
    //从左到右
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"5 火龙果";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:50];
        [self.view addSubview:lab];
        self.lab5 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"6 喜马拉雅";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab6 = lab;
    }
    
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"7 西瓜南瓜冬瓜";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab7 = lab;
    }
    
    //从左到右
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 90)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"8";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
//        [lab autoResizeWithMinWidth:10 maxWidth:50];
        [self.view addSubview:lab];
        self.lab8 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 50)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"9";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
//        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab9 = lab;
    }
    
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"10";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
//        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab10 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"11";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        //        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab11 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 210, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"12";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        //        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self.view addSubview:lab];
        self.lab12 = lab;
    }
    
    
    FreeLayoutView *freeLayoutView = [[FreeLayoutView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    [self.view addSubview:freeLayoutView];
    self.freeLayoutView = freeLayoutView;
    
    LineLayoutView *lineLayoutView = [[LineLayoutView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    [self.view addSubview:lineLayoutView];
    self.lineLayoutView = lineLayoutView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    //每次重新开始布局时需要复原布局参数
    self.view.insets = UIEdgeInsetsMake(100, 20, 20, 20);
//    [self.view floatReset];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //长屏(iPhone5及以上) 短屏(iPhone4S以下)
//    CGFloat spacingY = 20;
    //    self.lab1.margins = UIEdgeInsetsMake(50, 50, 50, 50);
    
    /***** 1 2 3 4 ******/
    //从上向下线性布局
//    self.view
//        .flowTopSpacing(100)
//        .flowTopSubview(self.lab1,LLVerticalAlignmentRight,spacingY)
//        .flowTopSubview(self.lab2,LLVerticalAlignmentRight,spacingY)
//        .flowTopSubview(self.lab3,LLVerticalAlignmentRight,spacingY)
//        .flowTopSubview(self.lab4,LLVerticalAlignmentRight,spacingY);
    
    /***** 5 6 7 ******/
    //从下向上线性布局
//    self.view
//        .flowBottomSubview(self.lab5,LLVerticalAlignmentCenter,spacingY)
//        .flowBottomSubview(self.lab6,LLVerticalAlignmentCenter,spacingY)
//        .flowBottomSubview(self.lab7,LLVerticalAlignmentCenter,spacingY);
    
    //从左到右线性布局
//    self.view
//        .flowLeftSubview(self.lab5,LLHorizontalAlignmentCenter,5)
//        .flowLeftSubview(self.lab6,LLHorizontalAlignmentCenter,5)
//        .flowLeftSubview(self.lab7,LLHorizontalAlignmentCenter,5);
    
    //自由布局(上向下线性布局)
    CGFloat spacingY = 20;
//    [self.view freelayoutOffset:UIOffsetMake(self.view.insets.left, self.view.insets.top)];
//    [self.view freelayoutSubview:self.lab5 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexLeftBottom offset:UIOffsetMake(0, spacingY)];
//    [self.view freelayoutSubview:self.lab6 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexLeftBottom offset:UIOffsetMake(0, spacingY)];
//    [self.view freelayoutSubview:self.lab7 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexLeftBottom offset:UIOffsetMake(0, spacingY)];
        
    //重叠
//    [self.view freelayoutOffset:CGPointMake(100, 100)];
//    [self.view freelayoutSubview:self.lab5 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexLeftTop offset:UIOffsetMake(10, 10)];
//    [self.view freelayoutSubview:self.lab6 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexLeftTop offset:UIOffsetMake(10, 10)];
//    [self.view freelayoutSubview:self.lab7 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexLeftTop offset:UIOffsetMake(10, 10)];
    
    //纯自由布局
    self.freeLayoutView.insets = UIEdgeInsetsMake(20, 20, 20, 20);
    self.freeLayoutView.height = 400;
    self.freeLayoutView.hidden = YES;
    
    //线性布局
    self.lineLayoutView.insets = UIEdgeInsetsMake(20, 20, 20, 20);
    self.lineLayoutView.height = 400;
    self.lineLayoutView.hidden = NO;
}



@end
