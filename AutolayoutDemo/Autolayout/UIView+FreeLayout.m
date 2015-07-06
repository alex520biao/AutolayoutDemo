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


#define kFreeLayoutKey @"kFreeLayoutKey"

@implementation UIView (FreeLayout)

#pragma mark - 实现layoutDict
static const void *kPropertyKeyLayoutDict = &kPropertyKeyLayoutDict;
@dynamic layoutDict;
-(void)setLayoutDict:(NSMutableDictionary*)layoutDict{
    objc_setAssociatedObject(self, kPropertyKeyLayoutDict, layoutDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary*)layoutDict{
    NSMutableDictionary *value = objc_getAssociatedObject(self, kPropertyKeyLayoutDict);
    if (!value) {
        value = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, kPropertyKeyLayoutDict, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return value;
}

- (FreeLayout *)freelayoutWithTag:(int)tag
                            start:(FLVertex)startVertex
                            block:(void(^)(FreeLayout *layout))block{
    //初始化LineLayout
    NSString *key = [NSString stringWithFormat:@"%@%d",kFreeLayoutKey,tag];
    FreeLayout *freeLayout = [[FreeLayout alloc] initWithKey:key
                                                        view:self
                                                       start:startVertex
                                                       block:block];
    //每种LLType只能添加一个layout对象
    [self.layoutDict setObject:freeLayout forKey:key];
    
    //UIView添加新layout对象需要标记needsLayout
    [self setNeedsLayout];
    //立即检查重新布局
    [self layoutIfNeeded];

    return freeLayout;
}

-(void)removeFreelayoutWithTag:(int)tag{
    NSString *key = [NSString stringWithFormat:@"%@%d",kFreeLayoutKey,tag];
    
    if ([self.layoutDict objectForKey:key]) {
        [self.layoutDict removeObjectForKey:key];
    }
}

-(void)removeAllFreelayout{
    [self.layoutDict removeAllObjects];
}

@end
