//
//  UIView+FreeLayout.h
//  AutolayoutDemo
//
//  Created by alex on 15/6/25.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeLayout.h"

@class FreeLayout;
/*!
 *  @brief  自由布局是相对布局的实现
 *  @note   只管理子视图的位置,不会修改尺寸。简单需求使用FreeLayout较为简单。
 *  @note   FreeLayout基本原理是使用一段二维折线将若干子视图串联起来，最后呈现出的布局效果。
 *
 */
@interface UIView (FreeLayout)

@property (nonatomic, strong) NSMutableDictionary *layoutDict;

#pragma mark - lineLayout线性布局
- (FreeLayout *)freelayoutWithTag:(int)tag
                            start:(FLVertex)startVertex
                            block:(void(^)(FreeLayout *layout))block;


-(void)removeFreelayoutWithTag:(int)tag;



@end
