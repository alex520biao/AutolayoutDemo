//
//  UIView+LinearLayout.h
//  DiCarpool
//
//  Created by alex on 15/4/9.
//  Copyright (c) 2015年 DiDi. All rights reserved.
//

#import <UIKit/UIKit.h>

//线性布局方向
typedef enum {
    LLVerticalAlignmentNone,      //不对齐
    LLVerticalAlignmentLeft,      //左对齐
    LLVerticalAlignmentCenter,    //居中对齐
    LLVerticalAlignmentRight,     //右对齐
} LLVerticalAlignment;

//水平线性布局对齐方式(从左向右,从右向左)
typedef enum {
    LLHorizontalAlignmentNone,        //不对齐
    LLHorizontalAlignmentTop,         //上对齐
    LLHorizontalAlignmentCenter,      //居中对齐
    LLHorizontalAlignmentBottom       //下对齐
} LLHorizontalAlignment;

typedef UIView *(^FlowTopSpacingBlcok)(CGFloat spacing);

typedef UIView *(^FlowTopSubviewBlcok)(UIView *subview,LLVerticalAlignment alignment,CGFloat spacing);
typedef UIView *(^FlowBottomSubviewBlcok)(UIView *subview,LLVerticalAlignment alignment,CGFloat spacing);

typedef UIView *(^FlowLeftSubviewBlcok)(UIView *subview,LLHorizontalAlignment alignment,CGFloat spacing);

/*!
 *  @brief  子视图的线性布局以适应各种不同尺寸屏幕,线性布局只有一行
 *
 */
@interface UIView (LinearLayout)

/*!
 *  @brief  还原float参数
 *
 */
-(void)floatReset;

#pragma mark - UIView的padding/insets(内边距)
@property (nonatomic, assign) UIEdgeInsets insets;

#pragma mark - UIView的margin(外边距)
@property (nonatomic, assign) UIEdgeInsets margins;


#pragma mark - 自上向下的流式布局
@property (nonatomic, assign) CGFloat flowTop;

@property(nonatomic,readonly) FlowTopSpacingBlcok flowTopSpacing;
@property(nonatomic,readonly) FlowTopSubviewBlcok flowTopSubview;

/*!
 *  @brief  从上向下的流式布局添加spacing
 *
 *  @param spacing
 */
-(UIView*)flowTopSpacing:(CGFloat)spacing;

/*!
 *  @brief  让self的subview从上向下开始流式布局
 *  @note   subview必须是当前view的非隐藏子视图
 *
 *  @param subview
 *  @param alignment   alignment对齐方式
 */
-(UIView*)flowTopSubview:(UIView *)subview
               alignment:(LLVerticalAlignment)alignment
                 spacing:(CGFloat)spacing;


#pragma mark - 自下向上的流式布局
@property (nonatomic, assign) CGFloat flowBottom;

@property(nonatomic,readonly) FlowBottomSubviewBlcok flowBottomSubview;

/*!
 *  @brief  从下向上的流式布局添加spacing
 *
 *  @param spacing
 */
-(void)flowBottomSpacing:(CGFloat)spacing;

/*!
 *  @brief  让self的subview从底部开始流式布局
 *  @note 此方法将修改subview在垂直方向的位置
 *  @note   subview必须是当前view的非隐藏子视图
 *
 *  @param subview     subbiew
 *  @param spacing     subview上间距
 */
-(void)flowBottomSubview:(UIView *)subview
                 spacing:(CGFloat)spacing;

#pragma mark - 自左向右的线性布局
@property (nonatomic, assign) CGFloat flowLeft;


@property(nonatomic,readonly) FlowLeftSubviewBlcok flowLeftSubview;

/*!
 *  @brief  让self的subview从左向右开始流式布局
 *
 *  @param subview
 */
-(UIView*)flowLeftSubview:(UIView *)subview
                alignment:(LLHorizontalAlignment)alignment
                  spacing:(CGFloat)spacing;






@end
