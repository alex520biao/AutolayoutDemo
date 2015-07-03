//
//  UIView+FreeLayout.m
//  AutolayoutDemo
//
//  Created by alex on 15/6/25.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "UIView+FreeLayout.h"
#import <objc/runtime.h>
#import "UIViewAdditions.h"

#import "FreeLayout.h"
#import "LineLayout.h"

@implementation UIView (FreeLayout)

#pragma mark - 实现freeLayout
static const void *kPropertyKeyFreeLayout = &kPropertyKeyFreeLayout;
@dynamic freeLayout;
-(void)setFreeLayout:(FreeLayout*)freeLayout{
    objc_setAssociatedObject(self, kPropertyKeyFreeLayout, freeLayout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FreeLayout*)freeLayout{
    FreeLayout *value = objc_getAssociatedObject(self, kPropertyKeyFreeLayout);
    return value;
}


- (FreeLayout *)freelayoutWithStart:(FLVertex)startVertex
                              block:(void(^)(FreeLayout *layout))block{
    //初始化LineLayout
    FreeLayout *freeLayout = [[FreeLayout alloc] initWithView:self start:startVertex];
    if (block) {
        block(freeLayout);
    }
    
    self.freeLayout = freeLayout;
    
    //UIView添加新layout对象需要标记needsLayout
    [self setNeedsLayout];
    //立即检查重新布局
    [self layoutIfNeeded];

    return freeLayout;
}

@end
