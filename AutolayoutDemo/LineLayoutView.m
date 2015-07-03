//
//  LineLayoutView.m
//  AutolayoutDemo
//
//  Created by liubiao on 15/6/30.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "LineLayoutView.h"
#import "UILabel+AutoResize.h"
#import "UIViewAdditions.h"
#import "UIView+FreeLayout.h"
#import "UIView+LineLayout.h"
#import "AutoLayout.h"

@interface LineLayoutView ()

@property (nonatomic,strong)UILabel *lab1;
@property (nonatomic,strong)UILabel *lab2;
@property (nonatomic,strong)UILabel *lab3;
@property (nonatomic,strong)UILabel *lab4;
@property (nonatomic,strong)UILabel *lab5;
@property (nonatomic,strong)UILabel *lab6;
@property (nonatomic,strong)UILabel *lab7;

@end

@implementation LineLayoutView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        //子视图初始化
        [self setupSubViews];
    }
    return self;
}

#pragma mark - setupSubViews 子视图初始化
/*!
 *  @brief  子视图初始化
 *  @note   只能有子视图初始化代码,严禁干其他任何事情
 */
- (void)setupSubViews{
    self.backgroundColor = [UIColor redColor];
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"1 水费电费税费";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self addSubview:lab];
        self.lab1 = lab;
    }
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"2水费电";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self addSubview:lab];
        self.lab2 = lab;
    }
    
    
    {
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
        lab.backgroundColor=[UIColor blueColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=@"3爽肤水";
        lab.textColor=[UIColor redColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.lineBreakMode=NSLineBreakByTruncatingTail;
        lab.numberOfLines=1;
        [lab autoResizeWithMinWidth:10 maxWidth:200];
        [self addSubview:lab];
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
        [self addSubview:lab];
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
        [self addSubview:lab];
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
        [self addSubview:lab];
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
        [self addSubview:lab];
        self.lab7 = lab;
    }
    
    self.clipsToBounds = YES;
    
    UIButton *lineBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [lineBtn setTitle:@"切换" forState:UIControlStateNormal];
    [lineBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    lineBtn.backgroundColor = [UIColor yellowColor];
    lineBtn.frame=CGRectMake(0,75,30,30);
    lineBtn.centerX=CGRectGetMidX(self.bounds);
    lineBtn.centerY=CGRectGetMidY(self.bounds);
    [lineBtn addTarget:self action:@selector(lineBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:lineBtn];
    
    //添加线性布局约束
    [self linelayoutWithType:LLTypeLeftTop_Down
                       block:^(LineLayout *layout) {
                            layout.linelayoutTuple(self.lab1,10)
                                  .linelayoutTuple(self.lab2,11)
                                  .linelayoutTuple(self.lab3,12)
                                  .linelayoutTuple(self.lab4,13)
                                  .linelayoutTuple(self.lab5,14)
                                  .linelayoutTuple(self.lab6,15)
                                  .linelayoutTuple(self.lab7,16);
                        }];
}

#pragma mark - layoutSubviews 子视图布局
/*!
 *  @brief  子视图布局
 *  @note   只能有子视图布局代码,严禁干其他任何事情。
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    
}

#pragma mark - Action && UIGestureRecognizer 控件&&手势响应
#pragma mark - Action && UIGestureRecognizer 控件&&手势响应
-(void)lineBtnAction:(UIButton*)sender{
    self.insets = UIEdgeInsetsMake(20, 20, 20, 20);
    
    sender.tag = sender.tag +1;
    LLType type = (LLType)sender.tag%12;
    
    //添加线性布局约束
    [self linelayoutWithType:type
                       block:^(LineLayout *layout) {
                           layout.linelayoutTuple(self.lab1,10)
                           .linelayoutTuple(self.lab2,11)
                           .linelayoutTuple(self.lab3,12)
                           .linelayoutTuple(self.lab4,13)
                           .linelayoutTuple(self.lab5,14)
                           .linelayoutTuple(self.lab6,15)
                           .linelayoutTuple(self.lab7,16);
                       }];
    

}

@end
