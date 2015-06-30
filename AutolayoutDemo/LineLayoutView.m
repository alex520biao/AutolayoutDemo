//
//  LineLayoutView.m
//  AutolayoutDemo
//
//  Created by liubiao on 15/6/30.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "LineLayoutView.h"
#import "UILabel+AutoResize.h"
#import "UIView+LinearLayout.h"
#import "UIViewAdditions.h"
#import "UIView+FreeLayout.h"
#import "UIView+LinearLayout.h"

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
}

#pragma mark - layoutSubviews 子视图布局
/*!
 *  @brief  子视图布局
 *  @note   只能有子视图布局代码,严禁干其他任何事情。
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    
    {
        //(左上顶点,向下)轴,内侧
        [self linelayoutFreeAnchor:LLAxialLeftTop_Down];
        [self linelayoutSubview:self.lab5 axial:LLAxialLeftTop_Down spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialLeftTop_Down spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialLeftTop_Down spacing:10];
        
        //(左上顶点,向右)轴,内侧
        [self linelayoutFreeAnchor:LLAxialLeftTop_Right];
        [self linelayoutSubview:self.lab5 axial:LLAxialLeftTop_Right spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialLeftTop_Right spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialLeftTop_Right spacing:10];
        
        //(左中顶点,向右)轴,中间
        [self linelayoutFreeAnchor:LLAxialLeftCenter_Right];
        [self linelayoutSubview:self.lab5 axial:LLAxialLeftCenter_Right spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialLeftCenter_Right spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialLeftCenter_Right spacing:10];
    }
    
    {
        //(左下顶点,向上)轴,内侧
        [self linelayoutFreeAnchor:LLAxialLeftBottom_Up];
        [self linelayoutSubview:self.lab5 axial:LLAxialLeftBottom_Up spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialLeftBottom_Up spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialLeftBottom_Up spacing:10];
        
        //(左下顶点,向右)轴,内侧
        [self linelayoutFreeAnchor:LLAxialLeftBottom_Right];
        [self linelayoutSubview:self.lab5 axial:LLAxialLeftBottom_Right spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialLeftBottom_Right spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialLeftBottom_Right spacing:10];
        
        //(中上顶点,向下)轴,中间
        [self linelayoutFreeAnchor:LLAxialCenterTop_Down];
        [self linelayoutSubview:self.lab5 axial:LLAxialCenterTop_Down spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialCenterTop_Down spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialCenterTop_Down spacing:10];
    }
    
    {
        //(中下顶点,向上)轴,中间
        [self linelayoutFreeAnchor:LLAxialCenterBottom_Up];
        [self linelayoutSubview:self.lab5 axial:LLAxialCenterBottom_Up spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialCenterBottom_Up spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialCenterBottom_Up spacing:10];
        
        //(右上顶点,向左)轴,内侧
        [self linelayoutFreeAnchor:LLAxialRightTop_Left];
        [self linelayoutSubview:self.lab5 axial:LLAxialRightTop_Left spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialRightTop_Left spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialRightTop_Left spacing:10];
        
        //(右上顶点,向下)轴,内侧
        [self linelayoutFreeAnchor:LLAxialRightTop_Down];
        [self linelayoutSubview:self.lab5 axial:LLAxialRightTop_Down spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialRightTop_Down spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialRightTop_Down spacing:10];
    }
    
    {
        //(右中顶点,向左)轴,中间
        [self linelayoutFreeAnchor:LLAxialRightCneter_Left];
        [self linelayoutSubview:self.lab5 axial:LLAxialRightCneter_Left spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialRightCneter_Left spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialRightCneter_Left spacing:10];
        
        //(右下顶点,向上)轴,内侧
        [self linelayoutFreeAnchor:LLAxialRightBottom_Up];
        [self linelayoutSubview:self.lab5 axial:LLAxialRightBottom_Up spacing:10];
        [self linelayoutSubview:self.lab6 axial:LLAxialRightBottom_Up spacing:10];
        [self linelayoutSubview:self.lab7 axial:LLAxialRightBottom_Up spacing:10];
        
        //(右下顶点,向左)轴,内侧
        self.linelayoutFreeAnchorBlock(LLAxialRightBottom_Left)
            .llSubview(self.lab5,LLAxialRightBottom_Left,10)
            .llSubview(self.lab6,LLAxialRightBottom_Left,10)
            .llSubview(self.lab7,LLAxialRightBottom_Left,10);
    }


}

#pragma mark - Action && UIGestureRecognizer 控件&&手势响应

@end
