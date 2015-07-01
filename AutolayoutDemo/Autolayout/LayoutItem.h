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

//LayoutItem可以分为两类: subview和spacing, subview的本身尺寸加上margin, spacing就是纯粹的占位空间
@interface LayoutItem : NSObject

#pragma mark - subview
@property (nonatomic, weak) UIView *subview;
@property (nonatomic, assign) FLVertex vertexBrfore;
@property (nonatomic, assign) FLVertex vertexAfter;
@property (nonatomic, assign) UIOffset offset;

#pragma mark - spacing
@property (nonatomic, assign) CGFloat spacing;



@end
