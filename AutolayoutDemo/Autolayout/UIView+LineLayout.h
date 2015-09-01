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
 #  @note   LineLayout是FreeLayout的一种特殊情况。依据直线布局子视图。
 *
 */
@interface UIView (LineLayout)

#pragma mark - lineLayout线性布局
/*!
 *  @brief  给当前UIView添加一个LLType类型的线型布局约束
 *  @note   此方法会触发layoutsubviews调用,因此layoutsubviews中不能调用此方法否则会死循环
 *
 *  @param tag   layout的tag
 *  @param type  线性布局LLType类型
 *  @param block 使用block加载layoutItem
 */
- (LineLayout *)linelayoutWithTag:(int)tag
                             type:(LLType)type
                            block:(void(^)(LineLayout *layout))block;

/*!
 *  @brief  移除当前UIView上所有LLType类型的线性布局
 *
 */
-(void)removeLinelayoutWithType:(LLType)type;

/*!
 *  @brief  移除所有线性布局约束
 */
-(void)removeAllLinelayout;




@end
