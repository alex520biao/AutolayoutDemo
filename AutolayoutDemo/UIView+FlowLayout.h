//
//  UIView+FlowLayout.h
//  DiCarpool
//
//  Created by alex520biao on 15/4/9. aintain by alex520biao
//  Copyright (c) 2015年 DiDi. All rights reserved.
//

#import <UIKit/UIKit.h>


/*!
 *  @brief  子视图的简单流式自动布局以适应各种不同尺寸屏幕
 *
 */
@interface UIView (FlowLayout)

/*!
 *  @brief  从左边开始流式布局
 *
 *  @param view
 */
-(void)addSubviewFlowLeft:(UIView *)view;

/*!
 *  @brief  还原float参数
 *
 */
-(void)floatReset;


#pragma mark - 自上向下的流式布局
@property (nonatomic, assign) CGFloat flowTop;

/*!
 *  @brief  从上向下的流式布局添加margin
 *
 *  @param margin
 */
-(void)flowTopSubviewWithMargin:(CGFloat)margin;

/*!
 *  @brief  让self的subview从上向下开始流式布局
 *  @note   subview必须是当前view的非隐藏子视图
 *
 *  @param subview
 */
-(void)flowTopSubviewWithMarginTop:(CGFloat)marginTop
                           subview:(UIView *)subview
                       marginBelow:(CGFloat)marginBelow;


#pragma mark - 自下向上的流式布局
@property (nonatomic, assign) CGFloat flowBottom;

/*!
 *  @brief  从下向上的流式布局添加margin
 *
 *  @param margin
 */
-(void)flowBottomSubviewWithMargin:(CGFloat)margin;

/*!
 *  @brief  让self的subview从底部开始流式布局
 *  @note 此方法将修改subview在垂直方向的位置
 *  @note   subview必须是当前view的非隐藏子视图
 *
 *  @param marginBelow subview下边距
 *  @param subview     subbiew
 *  @param marginTop   subview上边距
 */
-(void)flowBottomSubviewWithMarginBelow:(CGFloat)marginBelow
                                subview:(UIView *)subview
                              marginTop:(CGFloat)marginTop;

@end
