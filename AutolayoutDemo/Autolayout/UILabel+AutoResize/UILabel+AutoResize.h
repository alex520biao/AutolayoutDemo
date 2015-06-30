//
//  UILabel+AutoResize.h
//  alex
//
//  Created by alex on 14-5-28.
//  Copyright (c) 2014年 xiaojukeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AutoResize)

/*!
 *  @brief  UILabel根据txt内容自动调整宽度(最小宽度为0,高度不变)
 *
 *  @param maxWidth UILabel最大宽度,maxWidth必须大于0
 */
-(void)autoResizeWithMaxWidth:(CGFloat)maxWidth;

/*!
 *  @brief  UILabel根据txt内容自动调整宽度(高度不变)
 *
 *  @param minWidth 最小宽度
 *  @param maxWidth 最大宽度, maxWidth必须大于minWidth
 */
-(void)autoResizeWithMinWidth:(CGFloat)minWidth maxWidth:(CGFloat)maxWidth;

@end
