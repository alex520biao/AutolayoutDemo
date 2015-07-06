//
//  UIView+LineLayout.h
//  AutolayoutDemo
//
//  Created by liubiao on 15/7/1.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineLayout.h"

@class LineLayout;
/*!
 *  @brief  UIView线性布局
 #  @note   LineLayout是FreeLayout的一种特殊情况。使用一个二维线段将若干子视图串联起来，最后呈现出的布局效果。
 *
 */
@interface UIView (LineLayout)

#pragma mark - lineLayout线性布局

/*!
 *  @brief  为LLType类型添加布局约束(每种LLType类型的layout对象可以同时存在)
 #  @note   此方法会触发layoutsubviews调用,因此layoutsubviews中不能调用此方法否则会死循环
 *
 */
- (LineLayout *)linelayoutWithType:(LLType)type  block:(void(^)(LineLayout *layout))block;

/*!
 *  @brief  移除LLType对应的布局约束
 *
 */
-(void)removeLinelayoutWithType:(LLType)type;

/*!
 *  @brief  移除所有线性布局约束
 */
-(void)removeAllLinelayout;




@end
