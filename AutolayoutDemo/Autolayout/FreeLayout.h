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
@class LayoutItem;

/*!
 *  @brief  添加一个subview和offset类型的LayoutItem.使用Block实现链式语法
 */
typedef FreeLayout *(^AddFreeLayoutTupleBlock)(UIView *subview,FLVertex vertexBrfore,FLVertex vertexAfter,UIOffset offset);

/*!
 *  @brief  添加一个LayoutItemTypeSubview类型layoutItem
 */
typedef FreeLayout *(^AddFreeLayoutSubviewBlock)(UIView *subview,FLVertex vertexBrfore,FLVertex vertexAfter);

/*!
 *  @brief  添加一个LayoutItemTypeOffset类型的layoutItem
 */
typedef FreeLayout *(^AddFreeLayoutOffsetBlock)(UIOffset offset);


/*!
 *  @brief  相对布局对象
 */
@interface FreeLayout : NSObject

/*!
 *  @brief  layout弱引用view对象,防止出现循环引用
 */
@property (nonatomic, weak) UIView *view;

/*!
 *  @brief  开始布局起点
 */
@property (nonatomic, assign) FLVertex startVertex;

/*!
 *  @brief  layout对象中所有layoutItem
 */
@property (nonatomic, strong) NSMutableArray *layoutItemList;

/*!
 *  @brief  layoutKey用于唯一标识view上的layout对象
 */
@property (nonatomic, copy) NSString *layoutKey;

/*!
 *  @brief  创建FreeLayout对象
 *
 *  @param layoutKey   layout对象唯一标识符
 *  @param view        layout对应的父视图
 *  @param startVertex layout布局起始顶点
 *  @param block       LayoutItem初始化block
 *
 *  @return
 */
-(instancetype)initWithKey:(NSString*)layoutKey
                      view:(UIView*)view
                      start:(FLVertex)startVertex
                      block:(void(^)(FreeLayout *layout))block;


#pragma mark - 自由布局
@property (nonatomic, assign) CGPoint freeAnchor;

-(void)freeAnchorReset;

-(FreeLayout*)freelayoutFreeAnchor:(CGPoint)freeAnchor;

-(FreeLayout*)freelayoutOffset:(UIOffset)offset;

-(FreeLayout*)freelayoutSubview:(UIView *)subview
                   vertexBrfore:(FLVertex)vertexBrfore
                    vertexAfter:(FLVertex)vertexAfter;

-(FreeLayout*)freelayoutSubview:(UIView *)subview
                   vertexBrfore:(FLVertex)vertexBrfore
                    vertexAfter:(FLVertex)vertexAfter
                         offset:(UIOffset)offset;

#pragma mark - 对外封装方法
/*!
 *  @brief  添加一个LayoutItem对象
 *
 *  @param layoutItem
 *
 *  @return
 */
-(FreeLayout*)freelayoutItem:(LayoutItem *)layoutItem;

/*!
 *  @brief  添加一个subview和offset类型的LayoutItem
 *  @note   FreeLayoutItemBlock与freelayoutSubview:vertexBrfore:vertexAfter:offset等价
 */
@property(nonatomic,readonly) AddFreeLayoutTupleBlock freelayoutTuple;

/*!
 *  @brief  添加一个LayoutItemTypeSubview类型layoutItem
 */
@property(nonatomic,readonly) AddFreeLayoutSubviewBlock freeLayoutSubview;

/*!
 *  @brief  添加一个LayoutItemTypeOffset类型的layoutItem
 */
@property(nonatomic,readonly) AddFreeLayoutOffsetBlock freeLayoutOffset;

#pragma mark - 私有方法
/*!
 *  @brief  使用view、subview进行布局(不要直接调用)
 *
 */
-(void)layout;


@end
