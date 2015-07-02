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

- (LineLayout *)linelayoutWithType:(LLType)type  block:(void(^)(LineLayout *layout))block;



@end
