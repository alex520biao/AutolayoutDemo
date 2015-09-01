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

@interface UIView(LayoutAdditions)

#pragma mark - UIView的内外边距
/*!
 *  @brief  UIView的padding/insets(内边距)
 */
@property (nonatomic, assign) UIEdgeInsets insets;

/*!
 *  @brief  UIView的margin(外边距)
 */
@property (nonatomic, assign) UIEdgeInsets margins;


#pragma mark - UIView的9个顶点 vertex与frame、origin、center相似

//左上顶点(等价于origin)
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

//中中顶点(等价于center)
@property (nonatomic, assign)CGPoint vertexCenterCenter;

//中下顶点
@property (nonatomic, assign)CGPoint vertexCenterBottom;

@end