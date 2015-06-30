//
//  UIView+FreeLayout.h
//  AutolayoutDemo
//
//  Created by alex on 15/6/25.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LinearLayout.h"

//自由布局锚点方向(9个标准点) FL == FreeLayout
typedef enum {
    FLVertexLeftTop,        //左上顶点
    FLVertexLeftCenter,     //左中顶点
    FLVertexLeftBottom,     //坐下顶点
    FLVertexRightTop,       //右上顶点
    FLVertexRightCneter,    //右中顶点
    FLVertexRightBottom,    //右下顶点
    FLVertexCenterTop,      //中上顶点
    FLVertexCenterCenter,   //中中顶点
    FLVertexCenterBottom    //中下顶点
} FLVertex;

//线性布局轴向(共12种,所有共108种)
typedef enum {
    LLAxialLeftTop_Down,            //(左上顶点,向下)轴,内侧
    LLAxialLeftTop_Right,           //(左上顶点,向右)轴,内侧
    LLAxialLeftCenter_Right,        //(左中顶点,向右)轴,中间
    LLAxialLeftBottom_Up,           //(左下顶点,向上)轴,内侧
    LLAxialLeftBottom_Right,        //(左下顶点,向右)轴,内侧
    LLAxialCenterTop_Down,          //(中上顶点,向下)轴,中间
    LLAxialCenterBottom_Up,         //(中下顶点,向上)轴,中间
    LLAxialRightTop_Left,           //(右上顶点,向左)轴,内侧
    LLAxialRightTop_Down,           //(右上顶点,向下)轴,内侧
    LLAxialRightCneter_Left,        //(右中顶点,向左)轴,中间
    LLAxialRightBottom_Up,          //(右下顶点,向上)轴,内侧
    LLAxialRightBottom_Left,        //(右下顶点,向左)轴,内侧
} LLAxial;

//使用Block实现链式语法
typedef UIView *(^LinelayoutFreeAnchorBlock)(LLAxial axial);
typedef UIView *(^LLSubview)(UIView *subview,LLAxial axial,CGFloat spacing);

/*!
 *  @brief  自由布局是相对布局的实现
 *  @note   只管理子视图的位置,不会修改尺寸。简单需求使用FreeLayout较为简单。
 *
 */
@interface UIView (FreeLayout)


#pragma mark - 自由布局
@property (nonatomic, assign) CGPoint freeAnchor;

/*!
 *  @brief  还原float参数
 *
 */
-(void)freeAnchorReset;


/*!
 *  @brief  直接修改freeAnchor
 *
 */
-(UIView*)freelayoutFreeAnchor:(CGPoint)freeAnchor;

/*!
 *  @brief  修改freeAnchor: 偏移量offset
 *
 */
-(UIView*)freelayoutOffset:(UIOffset)offset;

/*!
 *  @brief  对subview自动布局。根据vertexBrfore修改subview
 *
 */
-(UIView*)freelayoutSubview:(UIView *)subview
               vertexBrfore:(FLVertex)vertexBrfore;

/*!
 *  @brief  移动锚点位置到subview的vertexAfter然后位置偏移offset
 *
 */
-(UIView*)freelayoutSubview:(UIView *)subview
                vertexAfter:(FLVertex)vertexAfter
                     offset:(UIOffset)offset;

/*!
 *  @brief  对subview自动布局。根据vertexBrfore修改subview，然后移动锚点位置到subview的vertexAfter
 *
 */
-(UIView*)freelayoutSubview:(UIView *)subview
               vertexBrfore:(FLVertex)vertexBrfore
                vertexAfter:(FLVertex)vertexAfter
                     offset:(UIOffset)offset;

#pragma mark - lineLayout线性布局
-(void)linelayoutFreeAnchor:(LLAxial)axial;

-(UIView*)linelayoutSubview:(UIView *)subview
                      axial:(LLAxial)axial
                    spacing:(CGFloat)spacing;



@property(nonatomic,readonly) LinelayoutFreeAnchorBlock linelayoutFreeAnchorBlock;
@property(nonatomic,readonly) LLSubview llSubview;



#pragma mark - UIView的9个顶点

//左上顶点
@property (nonatomic, assign)CGPoint vertexLeftTop;

//左中顶点
@property (nonatomic, assign)CGPoint vertexLeftCenter;

//坐下顶点
@property (nonatomic, assign)CGPoint vertexLeftBottom;

//右上顶点
@property (nonatomic, assign)CGPoint vertexRightTop;

//右中顶点
@property (nonatomic, assign)CGPoint vertexRightCneter;

//右下顶点
@property (nonatomic, assign)CGPoint vertexRightBottom;

//中上顶点
@property (nonatomic, assign)CGPoint vertexCenterTop;

//中中顶点
@property (nonatomic, assign)CGPoint vertexCenterCenter;

//中下顶点
@property (nonatomic, assign)CGPoint vertexCenterBottom;



@end
