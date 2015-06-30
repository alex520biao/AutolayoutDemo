//
//  UILabel+AutoResize.m
//  DidiPassenger
//
//  Created by alex on 14-5-28.
//  Copyright (c) 2014年 xiaojukeji. All rights reserved.
//

#import "UILabel+AutoResize.h"

@implementation UILabel (AutoResize)

/*!
 *  @brief  UILabel根据txt内容自动调整宽度(最小宽度为0,高度不变)
 *
 *  @param maxWidth UILabel最大宽度,maxWidth必须大于0
 */
-(void)autoResizeWithMaxWidth:(CGFloat)maxWidth{
    [self autoResizeWithMinWidth:0 maxWidth:maxWidth];
}

/*!
 *  @brief  UILabel根据txt内容自动调整宽度(高度不变)
 *
 *  @param minWidth 最小宽度
 *  @param maxWidth 最大宽度, maxWidth必须大于minWidth
 */
-(void)autoResizeWithMinWidth:(CGFloat)minWidth maxWidth:(CGFloat)maxWidth{
    //指定高度,自动计算宽度
    CGSize constraint = CGSizeMake(MAXFLOAT, self.frame.size.height);
    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:constraint lineBreakMode:self.lineBreakMode];
    CGFloat result = [UILabel takeResultWithValue:size.width minWidth:minWidth maxWidth:maxWidth]+10;
    
    CGRect frame = self.frame;
    frame.size.width = result;
    self.frame = frame;
}

#pragma mark - x在范围[a,b]限定取值
/*!
 *  @brief  根据length取值范围确定length最新值
 *
 *  @param minWidth 最小值
 *  @param maxWidth 最大值
 *  @param value    当前值
 *
 *  @return 结果
 */
+(CGFloat)takeResultWithValue:(CGFloat)value minWidth:(CGFloat)minWidth maxWidth:(CGFloat)maxWidth{
    CGFloat result = value;

    result = result<minWidth?minWidth:result;
    result = result>maxWidth?maxWidth:result;
    return result;
}



@end
