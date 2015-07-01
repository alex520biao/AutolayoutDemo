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
    LineLayout *lineLayout = [[LineLayout alloc] initWithView:self type:type];
    //设置lineLayout参数
    if (block) {
        block(lineLayout);
    }
    
    self.freeLayout = lineLayout;
    return lineLayout;
}


@end
