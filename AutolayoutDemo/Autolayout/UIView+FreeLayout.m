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
#import "UIView+LinearLayout.h"

@implementation UIView (FreeLayout)


#pragma mark - 实现freeAnchor
static const void *kPropertyKeyFreeAnchor = &kPropertyKeyFreeAnchor;
@dynamic freeAnchor;
-(void)setFreeAnchor:(CGPoint)freeAnchor{
    NSValue *value = [NSValue valueWithCGPoint:freeAnchor];
    objc_setAssociatedObject(self, kPropertyKeyFreeAnchor, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)freeAnchor{
    NSValue *value = objc_getAssociatedObject(self, kPropertyKeyFreeAnchor);
    if (value) {
        return [value CGPointValue];
    }else{
        return CGPointZero;
    }
}


/*!
 *  @brief  还原float参数
 *
 */
-(void)freeAnchorReset{
    
    self.freeAnchor = CGPointZero;
}

-(UIView*)freelayoutFreeAnchor:(CGPoint)freeAnchor{
    self.freeAnchor = freeAnchor;
    
    return self;
}

-(UIView*)freelayoutOffset:(UIOffset)offset{
    CGPoint freeAnchor = self.freeAnchor;
    freeAnchor.x = freeAnchor.x + offset.horizontal;
    freeAnchor.y = freeAnchor.y + offset.vertical;
    self.freeAnchor = freeAnchor;

    return self;
}

/*!
 *  @brief  对subview自动布局。根据vertexBrfore修改subview
 *
 */
-(UIView*)freelayoutSubview:(UIView *)subview
               vertexBrfore:(FLVertex)vertexBrfore{
    CGPoint freeAnchor = self.freeAnchor;
    
    //左上顶点
    if(vertexBrfore == FLVertexLeftTop){
        subview.left = freeAnchor.x;
        subview.top = freeAnchor.y;
    }
    //左中顶点
    else if (vertexBrfore == FLVertexLeftCenter){
        //将subview的左下顶点设置为freeAnchor
        subview.left = freeAnchor.x;
        subview.centerY = freeAnchor.y;
    }
    //左下顶点
    else if (vertexBrfore == FLVertexLeftBottom){
        subview.left = freeAnchor.x;
        subview.bottom = freeAnchor.y;
    }
    //右上顶点
    else if (vertexBrfore == FLVertexRightTop){
        subview.right = freeAnchor.x;
        subview.top = freeAnchor.y;
    }
    //右中顶点
    else if (vertexBrfore == FLVertexRightCneter){
        subview.right = freeAnchor.x;
        subview.centerY = freeAnchor.y;
    }
    //右下顶点
    else if (vertexBrfore == FLVertexRightBottom){
        subview.right = freeAnchor.x;
        subview.bottom = freeAnchor.y;
    }
    //中上顶点
    else if (vertexBrfore == FLVertexCenterTop){
        subview.centerX = freeAnchor.x;
        subview.top = freeAnchor.y;
    }
    //中中顶点
    else if (vertexBrfore == FLVertexCenterCenter){
        subview.centerX = freeAnchor.x;
        subview.centerY = freeAnchor.y;
    }
    //中下顶点
    else if (vertexBrfore == FLVertexCenterBottom){
        subview.centerX = freeAnchor.x;
        subview.bottom = freeAnchor.y;
    }

    return self;
}

/*!
 *  @brief  移动锚点位置到subview的vertexAfter
 *
 */
-(UIView*)freelayoutSubview:(UIView *)subview
                vertexAfter:(FLVertex)vertexAfter
                     offset:(UIOffset)offset{

    CGPoint freeAnchor = self.freeAnchor;
    
    //根据vertexAfter修改freeAnchor位置
    //左上顶点
    if(vertexAfter == FLVertexLeftTop){
        freeAnchor = subview.frame.origin;
    }
    //左中顶点
    else if (vertexAfter == FLVertexLeftCenter){
        freeAnchor.x = subview.left;
        freeAnchor.y = subview.centerY;
    }
    //左下顶点
    else if (vertexAfter == FLVertexLeftBottom){
        freeAnchor.x = subview.left;
        freeAnchor.y = subview.bottom;
    }
    //右上顶点
    else if (vertexAfter == FLVertexRightTop){
        freeAnchor.x = subview.right;
        freeAnchor.y = subview.top;
    }
    //右中顶点
    else if (vertexAfter == FLVertexRightCneter){
        freeAnchor.x = subview.right;
        freeAnchor.y = subview.centerY;
    }
    //右下顶点
    else if (vertexAfter == FLVertexRightBottom){
        freeAnchor.x = subview.right;
        freeAnchor.y = subview.bottom;
    }
    //中上顶点
    else if (vertexAfter == FLVertexCenterTop){
        freeAnchor.x = subview.centerX;
        freeAnchor.y = subview.top;
    }
    //中中顶点
    else if (vertexAfter == FLVertexCenterCenter){
        freeAnchor.x = subview.centerX;
        freeAnchor.y = subview.centerY;
    }
    //中下顶点
    else if (vertexAfter == FLVertexCenterBottom){
        freeAnchor.x = subview.centerX;
        freeAnchor.y = subview.bottom;
    }
    self.freeAnchor = freeAnchor;
    
    //offset
    [self freelayoutOffset:offset];
    
    return self;
}

-(UIView*)freelayoutSubview:(UIView *)subview
               vertexBrfore:(FLVertex)vertexBrfore
                vertexAfter:(FLVertex)vertexAfter
                     offset:(UIOffset)offset{
    
    //只有view上的显示的subview才允许参与布局
    if(subview && [self.subviews containsObject:subview] && !subview.hidden){
        //根据vertexBrfore修改subview位置
        [self freelayoutSubview:subview vertexBrfore:vertexBrfore];
        
        //根据vertexAfter修改freeAnchor位置
        [self freelayoutSubview:subview vertexAfter:vertexAfter offset:offset];
    }
    return self;
}

#pragma mark - lineLayout线性布局
-(void)linelayoutFreeAnchor:(LLAxial)axial{
    CGPoint freeAnchor = self.freeAnchor;
    
    //(左上顶点,向下)轴,内侧
    if (axial == LLAxialLeftTop_Down) {
        freeAnchor.x = self.insets.left;
        freeAnchor.y = self.insets.top;
    }
    //(左上顶点,向右)轴,内侧
    else if (axial == LLAxialLeftTop_Right) {
        freeAnchor.x = self.insets.left;
        freeAnchor.y = self.insets.top;
    }
    //(左中顶点,向右)轴,中间
    else if (axial == LLAxialLeftCenter_Right) {
        freeAnchor.x = self.insets.left;
        freeAnchor.y = CGRectGetMidY(self.bounds);
    }
    //(左下顶点,向上)轴,内侧
    else if (axial == LLAxialLeftBottom_Up) {
        freeAnchor.x = self.insets.left;
        freeAnchor.y = self.height - self.insets.bottom;
    }
    //(左下顶点,向右)轴,内侧
    else if (axial == LLAxialLeftBottom_Right) {
        freeAnchor.x = self.insets.left;
        freeAnchor.y = self.height - self.insets.bottom;
    }
    //(中上顶点,向下)轴,中间
    else if (axial == LLAxialCenterTop_Down) {
        freeAnchor.x = CGRectGetMidX(self.bounds);
        freeAnchor.y = self.insets.top;
    }
    //(中下顶点,向上)轴,中间
    else if (axial == LLAxialCenterBottom_Up) {
        freeAnchor.x = CGRectGetMidX(self.bounds);
        freeAnchor.y = self.height - self.insets.bottom;
    }
    //(右上顶点,向左)轴,内侧
    else if (axial == LLAxialRightTop_Left) {
        freeAnchor.x = self.width - self.insets.right;
        freeAnchor.y = self.insets.top;
    }
    //(右上顶点,向下)轴,内侧
    else if (axial == LLAxialRightTop_Down) {
        freeAnchor.x = self.width - self.insets.right;
        freeAnchor.y = self.insets.top;
    }
    //(右中顶点,向左)轴,中间
    else if (axial == LLAxialRightCneter_Left) {
        freeAnchor.x = self.width - self.insets.right;
        freeAnchor.y = CGRectGetMidY(self.bounds);
    }
    //(右下顶点,向上)轴,内侧
    else if (axial == LLAxialRightBottom_Up) {
        freeAnchor.x = self.width - self.insets.right;
        freeAnchor.y = self.height - self.insets.bottom;
    }
    //(右下顶点,向左)轴,内侧
    else if (axial == LLAxialRightBottom_Left) {
        freeAnchor.x = self.width - self.insets.right;
        freeAnchor.y = self.height - self.insets.bottom;
    }
    
    self.freeAnchor = freeAnchor;
}

-(UIView*)linelayoutSubview:(UIView *)subview
                      axial:(LLAxial)axial
                    spacing:(CGFloat)spacing{
    
    //(左上顶点,向下)轴,内侧
    if (axial == LLAxialLeftTop_Down) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftTop
                    vertexAfter:FLVertexLeftBottom
                         offset:UIOffsetMake(0, spacing)];
    }
    //(左上顶点,向右)轴,内侧
    else if (axial == LLAxialLeftTop_Right) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftTop
                    vertexAfter:FLVertexRightTop
                         offset:UIOffsetMake(spacing,0)];
    }
    //(左中顶点,向右)轴,中间
    else if (axial == LLAxialLeftCenter_Right) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftCenter
                    vertexAfter:FLVertexRightCneter
                         offset:UIOffsetMake(spacing, 0)];
    }
    //(左下顶点,向上)轴,内侧
    else if (axial == LLAxialLeftBottom_Up) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftBottom
                    vertexAfter:FLVertexLeftTop
                         offset:UIOffsetMake(0, -spacing)];
    }
    //(左下顶点,向右)轴,内侧
    else if (axial == LLAxialLeftBottom_Right) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftBottom
                    vertexAfter:FLVertexRightBottom
                         offset:UIOffsetMake(spacing, 0)];
    }
    //(中上顶点,向下)轴,中间
    else if (axial == LLAxialCenterTop_Down) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexCenterTop
                    vertexAfter:FLVertexCenterBottom
                         offset:UIOffsetMake(0, spacing)];
    }
    //(中下顶点,向上)轴,中间
    else if (axial == LLAxialCenterBottom_Up) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexCenterBottom
                    vertexAfter:FLVertexCenterTop
                         offset:UIOffsetMake(0, -spacing)];
    }
    //(右上顶点,向左)轴,内侧
    else if (axial == LLAxialRightTop_Left) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexRightTop
                    vertexAfter:FLVertexLeftTop
                         offset:UIOffsetMake(-spacing,0)];
    }
    //(右上顶点,向下)轴,内侧
    else if (axial == LLAxialRightTop_Down) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexRightTop
                    vertexAfter:FLVertexRightBottom
                         offset:UIOffsetMake(0, spacing)];
    }
    //(右中顶点,向左)轴,中间
    else if (axial == LLAxialRightCneter_Left) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexRightCneter
                    vertexAfter:FLVertexLeftCenter
                         offset:UIOffsetMake(-spacing, 0)];
    }
    //(右下顶点,向上)轴,内侧
    else if (axial == LLAxialRightBottom_Up) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexRightBottom
                    vertexAfter:FLVertexRightTop
                         offset:UIOffsetMake(0, -spacing)];
    }
    //(右下顶点,向左)轴,内侧
    else if (axial == LLAxialRightBottom_Left) {
            [self freelayoutSubview:subview
                       vertexBrfore:FLVertexRightBottom
                        vertexAfter:FLVertexLeftBottom
                             offset:UIOffsetMake(-spacing, 0)];
    }
    return self;
}




- (LinelayoutFreeAnchorBlock) linelayoutFreeAnchorBlock{
    return ^(LLAxial axial) {
        
        //代码实现
        [self linelayoutFreeAnchor:axial];
        return self;
    };
}

- (LLSubview) llSubview{
    return ^(UIView *subview,LLAxial axial,CGFloat spacing) {
        
        //代码实现
        [self linelayoutSubview:subview axial:axial spacing:spacing];
        return self;
    };
}


#pragma mark - UIView的9个顶点
//左上顶点
-(void)setVertexLeftTop:(CGPoint)vertexLeftTop{
    self.left   = vertexLeftTop.x;
    self.top    = vertexLeftTop.y;
}

-(CGPoint) vertexLeftTop{
    CGPoint vertex = CGPointMake(self.left, self.top);
    return vertex;
}

//左中顶点
-(void)setVertexLeftCenter:(CGPoint)vertexLeftCenter{
    self.left = vertexLeftCenter.x;
    self.centerY = vertexLeftCenter.y;
}

-(CGPoint) vertexLeftCenter{
    CGPoint vertex = CGPointMake(self.left, self.centerY);
    return vertex;
}

//坐下顶点
-(void)setVertexLeftBottom:(CGPoint)vertexLeftBottom{
    self.left = vertexLeftBottom.x;
    self.bottom = vertexLeftBottom.y;
}

-(CGPoint) vertexLeftBottom{
    CGPoint vertex = CGPointMake(self.left, self.bottom);
    return vertex;
}

//右上顶点
-(void)setVertexRightTop:(CGPoint)vertexRightTop{
    self.right = vertexRightTop.x;
    self.top = vertexRightTop.y;
}

-(CGPoint) vertexRightTop{
    CGPoint vertex = CGPointMake(self.right, self.top);
    return vertex;
}

//右中顶点
-(void)setVertexRightCneter:(CGPoint)vertexRightCneter{
    self.right = vertexRightCneter.x;
    self.centerY = vertexRightCneter.y;
}

-(CGPoint) vertexRightCneter{
    CGPoint vertex = CGPointMake(self.right, self.centerY);
    return vertex;
}

//右下顶点
-(void)setVertexRightBottom:(CGPoint)vertexRightBottom{
    self.right = vertexRightBottom.x;
    self.bottom = vertexRightBottom.y;
}

-(CGPoint) vertexRightBottom{
    CGPoint vertex = CGPointMake(self.right, self.bottom);
    return vertex;
}

//中上顶点
-(void)setVertexCenterTop:(CGPoint)vertexCenterTop{
    self.centerX = vertexCenterTop.x;
    self.centerY = vertexCenterTop.y;
}

-(CGPoint) vertexCenterTop{
    CGPoint vertex = CGPointMake(self.centerX, self.top);
    return vertex;
}

//中中顶点
-(void)setVertexCenterCenter:(CGPoint)vertexCenterCenter{
    self.centerX = vertexCenterCenter.x;
    self.centerY = vertexCenterCenter.y;
}

-(CGPoint) vertexCenterCenter{
    CGPoint vertex = CGPointMake(self.centerX, self.centerY);
    return vertex;
}

//中下顶点
-(void)setVertexCenterBottom:(CGPoint)vertexCenterBottom{
    self.centerX = vertexCenterBottom.x;
    self.centerY = vertexCenterBottom.y;
}

-(CGPoint) vertexCenterBottom{
    CGPoint vertex = CGPointMake(self.centerX, self.bottom);
    return vertex;
}

@end
