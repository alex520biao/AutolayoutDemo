//
//  FreelayoutViewController.m
//  AutolayoutDemo
//
//  Created by liubiao on 15/7/3.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "FreelayoutViewController.h"
#import "AutoLayout.h"

@interface FreelayoutViewController ()

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

@end

@implementation FreelayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self setupSubViews];
}

#pragma mark - setupSubViews 子视图初始化
/*!
 *  @brief  子视图初始化
 *  @note   只能有子视图初始化代码,严禁干其他任何事情
 */
- (void)setupSubViews{
    //subviews初始化
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 90)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"8";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
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
        [self.view addSubview:lab];
        self.lab12 = lab;
    }
    
    UIButton *lineBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [lineBtn setTitle:@"线性" forState:UIControlStateNormal];
    [lineBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    lineBtn.backgroundColor = [UIColor blueColor];
    lineBtn.frame=CGRectMake(0,75,60,44);
    lineBtn.left=20;
    [lineBtn addTarget:self action:@selector(lineBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lineBtn];
    
    
    UIButton *foldBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [foldBtn setTitle:@"折线" forState:UIControlStateNormal];
    [foldBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    foldBtn.backgroundColor = [UIColor blueColor];
    foldBtn.frame=CGRectMake(0,75,60,44);
    foldBtn.left=lineBtn.right+20;
    [foldBtn addTarget:self action:@selector(foldBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:foldBtn];
    
    UIButton *freeBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [freeBtn setTitle:@"任意曲线" forState:UIControlStateNormal];
    [freeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    freeBtn.backgroundColor = [UIColor blueColor];
    freeBtn.frame=CGRectMake(0,75,60,44);
    freeBtn.left=foldBtn.right+20;
    [freeBtn addTarget:self action:@selector(freeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:freeBtn];
    
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
    
}

#pragma mark - Action && UIGestureRecognizer 控件&&手势响应
-(void)lineBtnAction:(id)sender{
    self.view.insets = UIEdgeInsetsMake(20, 20, 20, 20);
    
    //移除已有布局约束
//    [self.view removeFreelayoutWithTag:10086];
//    [self.view removeFreelayoutWithTag:10087];
    [self.view removeAllLinelayout];

    //添加线性布局约束
    [self.view linelayoutWithTag:10087
                            type:LLTypeRightBottom_Up
                           block:^(LineLayout *layout) {
                               layout
                               .lineLayoutSpacing(30)
                               .linelayoutTuple(self.lab8,10)
                               .linelayoutTuple(self.lab9,10)
                               .linelayoutTuple(self.lab10,10)
                               .linelayoutTuple(self.lab11,10)
                               .linelayoutTuple(self.lab12,10);
                           }];
}

-(void)foldBtnAction:(id)sender{
    self.view.insets = UIEdgeInsetsMake(20, 20, 20, 20);
    
    //移除已有布局约束
//    [self.view removeLinelayoutWithType:LLTypeRightBottom_Up];
//    [self.view removeFreelayoutWithTag:10087];
    [self.view removeAllLinelayout];
    
    //纯自由相对布局(较复杂)
    [self.view freelayoutWithTag:10086
                           start:FLVertexLeftTop
                           block:^(FreeLayout *layout) {
                               layout.freeLayoutOffset(UIOffsetMake(50, 100))
                               .freelayoutTuple(self.lab8,FLVertexLeftTop,FLVertexRightTop,UIOffsetMake(10, 0))
                               .freelayoutTuple(self.lab9,FLVertexLeftTop,FLVertexLeftBottom,UIOffsetMake(0, 10))
                               .freelayoutTuple(self.lab10,FLVertexLeftTop,FLVertexRightTop,UIOffsetMake(10, 0))
                               .freelayoutTuple(self.lab11,FLVertexLeftTop,FLVertexRightBottom,UIOffsetMake(0, 10))
                               .freelayoutTuple(self.lab12,FLVertexRightTop,FLVertexRightBottom,UIOffsetMake(0, 10));
                           }];
}

-(void)freeBtnAction:(id)sender{
    self.view.insets = UIEdgeInsetsMake(20, 20, 20, 20);
    
    //移除已有布局约束
//    [self.view removeLinelayoutWithType:LLTypeRightBottom_Up];
//    [self.view removeFreelayoutWithTag:10086];
    [self.view removeAllLinelayout];
    
    //纯自由相对布局(较复杂)
    [self.view freelayoutWithTag:10087
                           start:FLVertexLeftTop
                           block:^(FreeLayout *layout) {
                               layout.freeLayoutOffset(UIOffsetMake(20, 100))
                               .freelayoutTuple(self.lab8,FLVertexLeftTop,FLVertexRightBottom,UIOffsetMake(0, 0))
                               .freelayoutTuple(self.lab9,FLVertexLeftTop,FLVertexRightBottom,UIOffsetMake(0, 0))
                               .freelayoutTuple(self.lab10,FLVertexLeftTop,FLVertexLeftBottom,UIOffsetMake(0, 0))
                               .freelayoutTuple(self.lab11,FLVertexRightTop,FLVertexLeftBottom,UIOffsetMake(0, 0))
                               .freelayoutTuple(self.lab12,FLVertexRightTop,FLVertexRightBottom,UIOffsetMake(0, 0));
                           }];
}



@end
