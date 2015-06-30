//
//  FreeLayoutView.m
//  AutolayoutDemo
//
//  Created by liubiao on 15/6/29.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "FreeLayoutView.h"
#import "UILabel+AutoResize.h"
#import "UIView+LinearLayout.h"
#import "UIViewAdditions.h"
#import "UIView+FreeLayout.h"
#import "UIView+LinearLayout.h"

@interface FreeLayoutView ()

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


@implementation FreeLayoutView

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
        [self addSubview:lab];
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
        [self addSubview:lab];
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
        [self addSubview:lab];
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
        [self addSubview:lab];
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
        [self addSubview:lab];
        self.lab12 = lab;
    }
}

#pragma mark - layoutSubviews 子视图布局
/*!
 *  @brief  子视图布局
 *  @note   只能有子视图布局代码,严禁干其他任何事情。
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    
    //纯自由相对布局(较复杂)
    [self freelayoutSubview:self.lab8 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexRightTop offset:UIOffsetMake(10, 0)];
    [self freelayoutSubview:self.lab9 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexLeftBottom offset:UIOffsetMake(0, 10)];
    [self freelayoutSubview:self.lab10 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexRightTop offset:UIOffsetMake(10, 0)];
    [self freelayoutSubview:self.lab11 vertexBrfore:FLVertexLeftTop vertexAfter:FLVertexRightBottom offset:UIOffsetMake(0, 10)];
    [self freelayoutSubview:self.lab12 vertexBrfore:FLVertexRightTop vertexAfter:FLVertexRightBottom offset:UIOffsetMake(0, 0)];    
}

#pragma mark - Action && UIGestureRecognizer 控件&&手势响应

@end
