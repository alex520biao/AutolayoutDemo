/**
 @header UIVIew+LayoutAdditions.h
 @abstract
 @code
 
 @link
 @version 1.00 2015 Creation
 @copyright Copyright (c) 2013 alex. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//线性布局方向
typedef enum {
    LLVerticalAlignmentNone,      //不对齐
    LLVerticalAlignmentLeft,      //左对齐
    LLVerticalAlignmentCenter,    //居中对齐
    LLVerticalAlignmentRight,     //右对齐
} LLVerticalAlignment;

//水平线性布局对齐方式(从左向右,从右向左)
typedef enum {
    LLHorizontalAlignmentNone,        //不对齐
    LLHorizontalAlignmentTop,         //上对齐
    LLHorizontalAlignmentCenter,      //居中对齐
    LLHorizontalAlignmentBottom       //下对齐
} LLHorizontalAlignment;


@interface UIView(LayoutAdditions)

#pragma mark - UIView的padding/insets(内边距)
@property (nonatomic, assign) UIEdgeInsets insets;

#pragma mark - UIView的margin(外边距)
@property (nonatomic, assign) UIEdgeInsets margins;


#pragma mark - UIView的9个顶点

//左上顶点
@property (nonatomic, assign)CGPoint vertexLeftTop;

//左中顶点
@property (nonatomic, assign)CGPoint vertexLeftCenter;

//坐下顶点
@property (nonatomic, assign)CGPoint vertexLeftBottom;

//右上顶点
@property (nonatomic, assign)CGPoint vertexRightTop;

//右中顶点
@property (nonatomic, assign)CGPoint vertexRightCneter;

//右下顶点
@property (nonatomic, assign)CGPoint vertexRightBottom;

//中上顶点
@property (nonatomic, assign)CGPoint vertexCenterTop;

//中中顶点
@property (nonatomic, assign)CGPoint vertexCenterCenter;

//中下顶点
@property (nonatomic, assign)CGPoint vertexCenterBottom;

@end