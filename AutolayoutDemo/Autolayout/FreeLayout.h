//
//  FreeLayout.h
//  AutolayoutDemo
//
//  Created by liubiao on 15/6/30.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//自由布局锚点方向(9个标准点) FL == FreeLayout
typedef enum {
    FLVertexLeftTop,        //左上顶点
    FLVertexLeftCenter,     //左中顶点
    FLVertexLeftBottom,     //坐下顶点
    FLVertexRightTop,       //右上顶点
    FLVertexRightCneter,    //右中顶点
    FLVertexRightBottom,    //右下顶点
    FLVertexCenterTop,      //中上顶点
    FLVertexCenterCenter,   //中中顶点
    FLVertexCenterBottom    //中下顶点
} FLVertex;

@class FreeLayout;
//使用Block实现链式语法
typedef FreeLayout *(^FreeLayoutItemBlock)(UIView *subview,FLVertex vertexBrfore,FLVertex vertexAfter,UIOffset offset);

//相对布局对象
@interface FreeLayout : NSObject

//弱引用
@property (nonatomic, weak) UIView *view;

//开始布局起点
@property (nonatomic, assign) FLVertex startVertex;

@property (nonatomic, strong) NSMutableArray *layoutItemList;


-(instancetype)initWithView:(UIView*)view start:(FLVertex)startVertex;

#pragma mark - 自由布局
@property (nonatomic, assign) CGPoint freeAnchor;

-(void)freeAnchorReset;

-(FreeLayout*)freelayoutFreeAnchor:(CGPoint)freeAnchor;

-(FreeLayout*)freelayoutOffset:(UIOffset)offset;

/*!
 *  @brief  对subview自动布局。根据vertexBrfore修改subview
 *
 */
-(FreeLayout*)freelayoutSubview:(UIView *)subview
               vertexBrfore:(FLVertex)vertexBrfore;
/*!
 *  @brief  移动锚点位置到subview的vertexAfter
 *
 */
-(FreeLayout*)freelayoutSubview:(UIView *)subview
                    vertexAfter:(FLVertex)vertexAfter
                         offset:(UIOffset)offset;

-(FreeLayout*)freelayoutSubview:(UIView *)subview
                   vertexBrfore:(FLVertex)vertexBrfore
                    vertexAfter:(FLVertex)vertexAfter
                         offset:(UIOffset)offset;

/*!
 *  @brief  使用view、subview进行布局
 *
 */
-(void)layout;

@property(nonatomic,readonly) FreeLayoutItemBlock freelayoutItem;

@end
