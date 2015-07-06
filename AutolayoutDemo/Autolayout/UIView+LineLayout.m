//
//  UIView+LineLayout.m
//  AutolayoutDemo
//
//  Created by liubiao on 15/7/1.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "UIView+LineLayout.h"
#import <objc/runtime.h>
#import "UIView+FreeLayout.h"

@implementation UIView (LineLayout)

- (LineLayout *)linelayoutWithType:(LLType)type  block:(void(^)(LineLayout *layout))block{
    //初始化LineLayout
    LineLayout *lineLayout = [[LineLayout alloc] initWithView:self type:type block:block];
    
    //每种LLType只能添加一个layout对象
    if (lineLayout.layoutKey) {
        [self.layoutDict setObject:lineLayout forKey:lineLayout.layoutKey];
    }
    
    //UIView添加新layout对象需要标记needsLayout
    [self setNeedsLayout];
    //立即检查重新布局
    [self layoutIfNeeded];

    return lineLayout;
}

-(void)removeLinelayoutWithType:(LLType)type{
    NSString *key = [NSString stringWithFormat:@"freeLayoutKeyLine%d",type];
    if ([self.layoutDict objectForKey:key]) {
        [self.layoutDict removeObjectForKey:key];
    }
    
    //UIView添加新layout对象需要标记needsLayout
    [self setNeedsLayout];
    //立即检查重新布局
    [self layoutIfNeeded];
}

/*!
 *  @brief  移除所有线性布局约束
 */
-(void)removeAllLinelayout{
    NSArray *keys = [NSArray arrayWithArray:self.layoutDict.allKeys];
    for (NSString *key in keys) {
        if ([self.layoutDict objectForKey:key]) {
            [self.layoutDict removeObjectForKey:key];
        }
    }
    
    //UIView添加新layout对象需要标记needsLayout
    [self setNeedsLayout];
    //立即检查重新布局
    [self layoutIfNeeded];
}


@end
