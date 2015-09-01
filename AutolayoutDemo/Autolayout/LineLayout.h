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

/*!
 *  @brief  添加一个subview和spacing(linelayoutSubview:spacing方法等价)
 */
typedef LineLayout *(^AddLineLayoutTupleBlock)(UIView *subview,CGFloat spacing);

/*!
 *  @brief  添加一个subview
 */
typedef LineLayout *(^AddLineLayoutSubviewBlock)(UIView *subview);

/*!
 *  @brief  添加一个spacing(必须为非负数)
 */
typedef LineLayout *(^AddLineLayoutSpacingBlock)(CGFloat spacing);

/*!
 *  @brief  LineLayout是FreeLayout子类,在相对布局基础上实现线性布局
 */
@interface LineLayout : FreeLayout

/*!
 *  @brief  线性布局类型(12种)
 */
@property (nonatomic, assign) LLType type;


-(LineLayout*)initWithTag:(int)tag
                     view:(UIView*)view
                     type:(LLType)type
                    block:(void(^)(LineLayout *layout))block;

#pragma mark - 包装Block
/*!
 *  @brief  添加一个subview和spacing(linelayoutSubview:spacing方法等价)
 */
@property(nonatomic,readonly) AddLineLayoutTupleBlock linelayoutTuple;

/*!
 *  @brief  添加一个subview
 */
@property(nonatomic,readonly) AddLineLayoutSubviewBlock lineLayoutSubview;

/*!
 *  @brief  添加一个spacing(必须为非负数)
 */
@property(nonatomic,readonly) AddLineLayoutSpacingBlock lineLayoutSpacing;



@end
