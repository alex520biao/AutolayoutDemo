//
//  LayoutItem.h
//  AutolayoutDemo
//
//  Created by alex520biao on 15/6/30.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FreeLayout.h"

//LayoutItemType的类型
typedef enum {
    LayoutItemTypeOffset    = 0,  //Offset
    LayoutItemTypeSubview   = 1   //Subview
} LayoutItemType;

/*!
 *  @brief  LayoutItem为FreeLayout的布局子项
 *  @note   LayoutItem可以分为两类: subview和offset, subview的本身尺寸加上margin, offset就是纯粹的占位空间
 */
@interface LayoutItem : NSObject

/*!
 *  @brief  LayoutItem类型
 */
@property (nonatomic, assign) LayoutItemType layoutItemType;

#pragma mark - subview只在layoutItemType为LayoutItemTypeSubview时有效
/*!
 *  @brief  LayoutItem只对subview弱引用
 */
@property (nonatomic, weak) UIView *subview;
/*!
 *  @brief  将subview的vertexBrfore顶点位置设置为superView的freeAnchor
 */
@property (nonatomic, assign) FLVertex vertexBrfore;
/*!
 *  @brief  将superView的freeAnchor设置为subview的vertexAfter订单
 */
@property (nonatomic, assign) FLVertex vertexAfter;

#pragma mark - offset只在layoutItemType为LayoutItemTypeOffset时有效
/*!
 *  @brief  layoutTtem代表的superView的freeAnchor的平面偏移量
 */
@property (nonatomic, assign) UIOffset offset;



@end
