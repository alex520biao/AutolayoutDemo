//
//  LayoutItem.h
//  AutolayoutDemo
//
//  Created by liubiao on 15/6/30.
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

#pragma mark - subview
//layoutItemType为LayoutItemTypeSubview时有效
@property (nonatomic, weak) UIView *subview;
@property (nonatomic, assign) FLVertex vertexBrfore;
@property (nonatomic, assign) FLVertex vertexAfter;

#pragma mark - offset
//layoutItemType为LayoutItemTypeOffset时有效
@property (nonatomic, assign) UIOffset offset;



@end
