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

/*!
 *  @brief  给当前UIView添加一个LLType类型的线型布局约束
 *
 *  @param tag   layout的tag
 *  @param type  线性布局LLType类型
 *  @param block 使用block加载layoutItem
 */
- (LineLayout *)linelayoutWithTag:(int)tag
                             type:(LLType)type
                            block:(void(^)(LineLayout *layout))block{
    //初始化LineLayout
    LineLayout *lineLayout = [[LineLayout alloc] initWithTag:tag view:self type:type block:block];

    
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

/*!
 *  @brief  移除所有LLType类型的线性布局约束
 *
 *  @param type 线性布局类型
 */
-(void)removeLinelayoutWithType:(LLType)type{
    NSMutableArray *keyArray = [NSMutableArray array];
    [self.layoutDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        FreeLayout *layout = (FreeLayout*)obj;
        if ([layout isKindOfClass:[LineLayout class]]) {
            LineLayout *lineLyout = (LineLayout*)layout;
            //lineLyout类型和指定type相同
            if (lineLyout.type == type) {
                [keyArray addObject:key];
            }
        }
    }];
    [self.layoutDict removeObjectsForKeys:keyArray];
    
    //UIView添加新layout对象需要标记needsLayout
    [self setNeedsLayout];
    //立即检查重新布局
    [self layoutIfNeeded];
}

/*!
 *  @brief  移除所有线性布局约束
 */
-(void)removeAllLinelayout{
    //遍历删除所有LineLayout类型的布局约束对象
    NSMutableArray *keyArray = [NSMutableArray array];
    [self.layoutDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        FreeLayout *layout = (FreeLayout*)obj;
        if ([layout isKindOfClass:[LineLayout class]]) {
            [keyArray addObject:key];
        }
    }];
    [self.layoutDict removeObjectsForKeys:keyArray];
    
    //UIView添加新layout对象需要标记needsLayout
    [self setNeedsLayout];
    //立即检查重新布局
    [self layoutIfNeeded];
}


@end
