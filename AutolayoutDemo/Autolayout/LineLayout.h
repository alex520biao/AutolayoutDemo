//
//  LineLayout.h
//  AutolayoutDemo
//
//  Created by liubiao on 15/6/30.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "FreeLayout.h"

//线性布局类型(共12种,所有轴向共108种)
typedef enum {
    LLTypeLeftTop_Down =0,         //(左上顶点,向下)轴,内侧
    LLTypeLeftTop_Right,           //(左上顶点,向右)轴,内侧
    LLTypeLeftCenter_Right,        //(左中顶点,向右)轴,中间
    LLTypeLeftBottom_Up,           //(左下顶点,向上)轴,内侧
    LLTypeLeftBottom_Right,        //(左下顶点,向右)轴,内侧
    LLTypeCenterTop_Down,          //(中上顶点,向下)轴,中间
    LLTypeCenterBottom_Up,         //(中下顶点,向上)轴,中间
    LLTypeRightTop_Left,           //(右上顶点,向左)轴,内侧
    LLTypeRightTop_Down,           //(右上顶点,向下)轴,内侧
    LLTypeRightCneter_Left,        //(右中顶点,向左)轴,中间
    LLTypeRightBottom_Up,          //(右下顶点,向上)轴,内侧
    LLTypeRightBottom_Left,        //(右下顶点,向左)轴,内侧
} LLType;

@class LineLayout;
//使用Block实现链式语法
typedef LineLayout *(^AddLineLayoutTupleBlock)(UIView *subview,CGFloat spacing);

typedef LineLayout *(^AddLineLayoutSubviewBlock)(UIView *subview);

//spacing表示子视图之间的间距，必须为非负数
typedef LineLayout *(^AddLineLayoutSpacingBlock)(CGFloat spacing);

//线性布局对象
@interface LineLayout : FreeLayout

@property (nonatomic, assign) LLType type;


-(LineLayout*)initWithView:(UIView*)view
                      type:(LLType)type;

#pragma mark - 包装Block
//LineLayoutItemBlock与linelayoutSubview:spacing等价
@property(nonatomic,readonly) AddLineLayoutTupleBlock linelayoutTuple;

@property(nonatomic,readonly) AddLineLayoutSubviewBlock lineLayoutSubview;

//spacing表示子视图之间的间距，必须为非负数
@property(nonatomic,readonly) AddLineLayoutSpacingBlock lineLayoutSpacing;


#pragma mark - 私有方法
-(void)layout;



@end
