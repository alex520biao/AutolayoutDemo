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

@interface LineLayoutView ()

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
    
    //添加线性布局约束
    [self linelayoutWithType:LLTypeRightCneter_Left
                       block:^(LineLayout *layout) {
                            layout.linelayoutTuple(self.lab5,10)
                                  .linelayoutTuple(self.lab6,10)
                                  .linelayoutTuple(self.lab7,10);
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

@end
