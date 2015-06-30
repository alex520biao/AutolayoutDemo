//
//  UIView+LinearLayout.m
//  DiCarpool
//
//  Created by alex on 15/4/9.
//  Copyright (c) 2015年 DiDi. All rights reserved.
//

#import "UIView+LinearLayout.h"
#import <objc/runtime.h>
#import "UIViewAdditions.h"
#import "UIView+FreeLayout.h"

@implementation UIView (LinearLayout)

/*!
 *  @brief  还原float参数
 *
 */
-(void)floatReset{
    self.flowTop= self.insets.top;
    self.flowBottom = self.frame.size.height - self.insets.bottom;
    
    self.flowLeft = self.insets.left;
    
    self.freeAnchor = CGPointZero;
}

#pragma mark - 实现insets
static const void *kPropertyKeyInsets = &kPropertyKeyInsets;
@dynamic insets;
-(void)setInsets:(UIEdgeInsets)insets{
    NSValue *value = [NSValue valueWithUIEdgeInsets:insets];
    objc_setAssociatedObject(self, kPropertyKeyInsets, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)insets{
    NSValue *value = objc_getAssociatedObject(self, kPropertyKeyInsets);
    if (value) {
        return [value UIEdgeInsetsValue];
    }else{
        return UIEdgeInsetsZero;
    }
}

#pragma mark - 实现margins
static const void *kPropertyKeyMargins = &kPropertyKeyMargins;
@dynamic margins;
-(void)setMargins:(UIEdgeInsets)margins{
    NSValue *value = [NSValue valueWithUIEdgeInsets:margins];
    objc_setAssociatedObject(self, kPropertyKeyMargins, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)margins{
    NSValue *value = objc_getAssociatedObject(self, kPropertyKeyMargins);
    if (value) {
        return [value UIEdgeInsetsValue];
    }else{
        return UIEdgeInsetsZero;
    }
}


#pragma mark - 自上向下的流式布局

#pragma mark 实现flowTop
static const void *kPropertyKeyFlowTop = &kPropertyKeyFlowTop;
@dynamic flowTop;
-(void)setFlowTop:(CGFloat)flowTop{
    if(!isnan(flowTop)){
        NSNumber *number = [NSNumber numberWithFloat:flowTop];
        objc_setAssociatedObject(self, kPropertyKeyFlowTop, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (CGFloat)flowTop{
    NSNumber *number = objc_getAssociatedObject(self, kPropertyKeyFlowTop);
    if (number) {
        return [number floatValue];
    }else{
        return self.insets.top;
    }
}

- (FlowTopSpacingBlcok) flowTopSpacing{
    return ^(CGFloat spacing) {
        
        //代码实现
        [self flowTopSpacing:spacing];
        return self;
    };
}

- (FlowTopSubviewBlcok) flowTopSubview{
    return ^(UIView *subview,LLVerticalAlignment alignment,CGFloat spacing) {
        
        //代码实现
        [self flowTopSubview:subview alignment:alignment spacing:spacing];
        return self;
    };
}

/*!
 *  @brief  从上向下的流式布局添加spacing
 *
 *  @param spacing
 */
-(UIView*)flowTopSpacing:(CGFloat)spacing{
    CGFloat flowTop = self.flowTop;
    flowTop = flowTop + spacing;
    self.flowTop = flowTop;
    
    return self;
}

/*!
 *  @brief  让self的subview从上向下开始流式布局
 *
 *  @param subview
 */
-(UIView*)flowTopSubview:(UIView *)subview
               alignment:(LLVerticalAlignment)alignment
                 spacing:(CGFloat)spacing{

    //只有view上的显示的subview才允许参与布局
    if(subview && [self.subviews containsObject:subview] && !subview.hidden){
        CGFloat flowTop = self.flowTop;
        //marginTop
        flowTop = flowTop + subview.margins.top;
        
        //alignment
        if(alignment == LLVerticalAlignmentLeft){
            subview.left = self.insets.left;
        }else if (alignment == LLVerticalAlignmentCenter){
            subview.centerX = CGRectGetMidX(self.bounds);
        }else if (alignment == LLVerticalAlignmentRight){
            subview.right = self.width - self.insets.right;
        }
        
        //subview
        subview.top = flowTop;
        flowTop = flowTop + subview.height;
        
        //marginBottom
        flowTop = flowTop + subview.margins.bottom;
        
        //spacing
        flowTop = flowTop + spacing;
        
        self.flowTop = flowTop;
    }
    
    return self;
}

#pragma mark - 自下向上的流式布局
#pragma mark 实现flowBottom
static const void *kPropertyKeyFlowBottom = &kPropertyKeyFlowBottom;
@dynamic flowBottom;
-(void)setFlowBottom:(CGFloat)flowBottom{
    NSNumber *number = [NSNumber numberWithFloat:flowBottom];
    objc_setAssociatedObject(self, kPropertyKeyFlowBottom, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)flowBottom{
    NSNumber *number = objc_getAssociatedObject(self, kPropertyKeyFlowBottom);
    if (number) {
        return [number floatValue];
    }else{
        return self.frame.size.height - self.insets.bottom;
    }
}

- (FlowBottomSubviewBlcok) flowBottomSubview{
    return ^(UIView *subview,LLVerticalAlignment alignment,CGFloat spacing) {
        
        //代码实现
        [self flowBottomSubview:subview alignment:alignment spacing:spacing];
        return self;
    };
}

/*!
 *  @brief  从下向上的流式布局添加spacing
 *
 *  @param spacing
 */
-(void)flowBottomSpacing:(CGFloat)spacing{
    CGFloat floatBottom = self.flowBottom;
    floatBottom = floatBottom - spacing;
    self.flowBottom = floatBottom;
}

/*!
 *  @brief  让self的subview从底部开始流式布局
 *  @note 此方法将修改subview在垂直方向的位置
 *  @note   subview必须是当前view的非隐藏子视图
 *
 *  @param subview     subbiew
 *  @param spacing     subview上间距
 */
-(void)flowBottomSubview:(UIView *)subview
               alignment:(LLVerticalAlignment)alignment
                 spacing:(CGFloat)spacing{

    //只有view上的显示的subview才允许参与布局
    if(subview && [self.subviews containsObject:subview] && !subview.hidden){
        CGFloat floatBottom = self.flowBottom;
        
        //marginBottom
        floatBottom = floatBottom - subview.margins.bottom;

        //alignment
        if(alignment == LLVerticalAlignmentLeft){
            subview.left = self.insets.left;
        }else if (alignment == LLVerticalAlignmentCenter){
            subview.centerX = CGRectGetMidX(self.bounds);
        }else if (alignment == LLVerticalAlignmentRight){
            subview.right = self.width - self.insets.right;
        }

        //subview height
        subview.bottom = floatBottom;
        floatBottom = floatBottom - subview.height;
        
        //marginTop
        floatBottom = floatBottom - subview.margins.top;
        
        //spacing
        floatBottom = floatBottom - spacing;
        
        self.flowBottom = floatBottom;
    }
}

#pragma mark - 自左向右的线性布局
#pragma mark 实现flowLeft
static const void *kPropertyKeyFlowLeft = &kPropertyKeyFlowLeft;
@dynamic flowLeft;
-(void)setFlowLeft:(CGFloat)flowLeft{
    if(!isnan(flowLeft)){
        NSNumber *number = [NSNumber numberWithFloat:flowLeft];
        objc_setAssociatedObject(self, kPropertyKeyFlowLeft, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (CGFloat)flowLeft{
    NSNumber *number = objc_getAssociatedObject(self, kPropertyKeyFlowLeft);
    if (number) {
        return [number floatValue];
    }else{
        return self.insets.left;
    }
}

- (FlowLeftSubviewBlcok) flowLeftSubview{
    return ^(UIView *subview,LLHorizontalAlignment alignment,CGFloat spacing) {
        
        //代码实现
        [self flowLeftSubview:subview alignment:alignment spacing:spacing];
        return self;
    };
}

/*!
 *  @brief  让self的subview从左向右开始流式布局
 *
 *  @param subview
 */
-(UIView*)flowLeftSubview:(UIView *)subview
                alignment:(LLHorizontalAlignment)alignment
                  spacing:(CGFloat)spacing{
    
    //只有view上的显示的subview才允许参与布局
    if(subview && [self.subviews containsObject:subview] && !subview.hidden){
        CGFloat flowLeft = self.flowLeft;
        //marginLeft
        flowLeft = flowLeft + subview.margins.left;
        
        //subview
        if(alignment == LLHorizontalAlignmentTop){
            subview.top = self.insets.top;
        }else if (alignment == LLHorizontalAlignmentCenter){
            subview.centerY = CGRectGetMidY(self.bounds);
        }else if (alignment == LLHorizontalAlignmentBottom){
            subview.bottom = self.height - self.insets.bottom;
        }
        subview.left = flowLeft;
        flowLeft = flowLeft + subview.width;
        
        //marginRight
        flowLeft = flowLeft + subview.margins.right;
        
        //spacing
        flowLeft = flowLeft + spacing;
        
        self.flowLeft = flowLeft;
    }
    
    return self;
}


@end
