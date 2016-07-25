//
//  UIView+FlowLayout.m
//  DiCarpool
//
//  Created by alex520biao on 15/4/9.
//  Copyright (c) 2015年 DiDi. All rights reserved.
//

#import "UIView+FlowLayout.h"
#import "UIViewAdditions.h"
#import <objc/runtime.h>

@implementation UIView (FlowLayout)

#pragma mark - 实现flowTop
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
    }
    return self.frame.size.height;
}


#pragma mark - 实现flowBottom
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
    }
    return self.frame.size.height;
}

/*!
 *  @brief  从左边开始流式布局
 *
 *  @param view
 */
-(void)addSubviewFlowLeft:(UIView *)view{

}

/*!
 *  @brief  还原float参数
 *
 */
-(void)floatReset{
    self.flowTop= 0;
    self.flowBottom = self.height;
}

#pragma mark - 自上向下的流式布局
/*!
 *  @brief  从上向下的流式布局添加margin
 *
 *  @param margin
 */
-(void)flowTopSubviewWithMargin:(CGFloat)margin{
    CGFloat flowTop = self.flowTop;
    flowTop = flowTop + margin;
    self.flowTop = flowTop;
}

/*!
 *  @brief  让self的subview从上向下开始流式布局
 *
 *  @param subview
 */
-(void)flowTopSubviewWithMarginTop:(CGFloat)marginTop
                           subview:(UIView *)subview
                       marginBelow:(CGFloat)marginBelow{
    
    //只有view上的显示的subview才允许参与布局
    if(subview && [self.subviews containsObject:subview] && !subview.hidden){
        CGFloat flowTop = self.flowTop;
        //marginTop
        flowTop = flowTop + marginTop;
        
        //subview
        subview.top = flowTop;
        flowTop = flowTop + subview.height;
        
        //marginBelow
        flowTop = flowTop + marginBelow;
        
        self.flowTop = flowTop;
    }
}

#pragma mark - 自下向上的流式布局
/*!
 *  @brief  流式布局添加margin(从下向上)
 *
 *  @param margin
 */
-(void)flowBottomSubviewWithMargin:(CGFloat)margin{
    CGFloat floatBottom = self.flowBottom;
    floatBottom = floatBottom - margin;
    self.flowBottom = floatBottom;
}


/*!
 *  @brief  让self的subview从底部开始流式布局
 *
 *  @param subview
 */
-(void)flowBottomSubviewWithMarginBelow:(CGFloat)marginBelow
                                subview:(UIView *)subview
                              marginTop:(CGFloat)marginTop{
    
    //只有view上的显示的subview才允许参与布局
    if(subview && [self.subviews containsObject:subview] && !subview.hidden){
        CGFloat floatBottom = self.flowBottom;
        //marginBelow
        floatBottom = floatBottom - marginBelow;

        //subview
        subview.bottom = floatBottom;
        floatBottom = floatBottom - subview.height;
        
        //marginTop
        floatBottom = floatBottom - marginTop;
        
        self.flowBottom = floatBottom;
    }
}

@end
