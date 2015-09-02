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
 *  @brief  添加一个LayoutItemTypeSubview类型layoutItem(使用Block实现链式语法)
 */
typedef FreeLayout *(^AddFreeLayoutSubviewBlock)(UIView *subview,FLVertex vertexBrfore,FLVertex vertexAfter);

/*!
 *  @brief  添加一个LayoutItemTypeOffset类型的layoutItem使用Block实现链式语法
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
 *  @brief  开始布局起点(view上的内顶点)
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
/*!
 *  @brief  自由布局对象的锚点位置
 */
@property (nonatomic, assign) CGPoint freeAnchor;

/*!
 *  @brief  直接设置当前布局freeAnchor锚点位置
 *
 *  @param freeAnchor
 */
-(FreeLayout*)freelayoutFreeAnchor:(CGPoint)freeAnchor;

/*!
 *  @brief  根据UIOffset平面偏移量来修改freeAnchor锚点位置
 *
 *  @param offset 平面偏移量
 */
-(FreeLayout*)freelayoutOffset:(UIOffset)offset;

/*!
 *  @brief  布局subview子视图
 *  @note   将freeAnchor赋值给subview的vertexBrfore顶点, subview.vertexBrfore = freeAnchor;
 *
 *  @param subview
 *  @param vertexBrfore
 *  @param vertexAfter
 */
-(FreeLayout*)freelayoutSubview:(UIView *)subview
                   vertexBrfore:(FLVertex)vertexBrfore
                    vertexAfter:(FLVertex)vertexAfter;
/*!
 *  @brief  添加一个LayoutItem对象
 *
 *  @param layoutItem
 *
 *  @return
 */
-(FreeLayout*)freelayoutItem:(LayoutItem *)layoutItem;

#pragma mark - 使用block实现链式语法
/*!
 *  @brief  添加一个LayoutItemTypeSubview类型layoutItem
 *  @note   与freelayoutSubview:vertexBrfore:vertexAfter方法等价
 */
@property(nonatomic,readonly) AddFreeLayoutSubviewBlock freeLayoutSubview;

/*!
 *  @brief  添加一个LayoutItemTypeOffset类型的layoutItem
 *  @note   与freelayoutOffset方法等价
 */
@property(nonatomic,readonly) AddFreeLayoutOffsetBlock freeLayoutOffset;

#pragma mark - 私有方法(此方法外部不要直接调用)
/*!
 *  @brief  使用FreeLayout对象参数(view、startVertex、layoutItemList)对view进行子视图布局
 *
 */
-(void)layout;


@end
