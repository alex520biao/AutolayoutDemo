//
//  UIScreen+ScreenHelper.h
//  DiCarpool
//
//  Created by liubiao on 15/6/12.
//  Copyright (c) 2015年 DiDi. All rights reserved.
//

#import <UIKit/UIKit.h>

//根据屏幕尺寸自动选择长度
#define SSLNG(s, m, n, l) [UIScreen lengthWithSmall:s medium:m normal:n large:l]

@interface UIScreen (ScreenHelper)

/*!
 *  @brief  所有iPhone屏幕尺寸分类(四种类型)
 *
 */
typedef NS_ENUM(NSInteger, UIScreenSizeType) {
    UIScreenSizeType_Small    = 0,  // 320*480及以下 iPhone4s及其以前设备
    UIScreenSizeType_Medium   = 1,  // 320*568      iPhone5/5C/5S
    UIScreenSizeType_Normal   = 2,  // 375*667      iPhone6
    UIScreenSizeType_Large    = 3   // 414*736及更大 iPhone6+及其更大
};

#pragma mark - screenSize
+ (UIScreenSizeType)screenSizeType;

/*!
 *  @brief  根据屏幕尺寸自动选择长度
 *
 *  @param smallLength  屏幕尺寸为UIScreenSizeType_Small时长度
 *  @param mediumLength 屏幕尺寸为UIScreenSizeType_Medium时长度
 *  @param normalLength 屏幕尺寸为UIScreenSizeType_Normal时长度
 *  @param largeLength  屏幕尺寸为UIScreenSizeType_Large时长度
 *
 *  @return
 */
+ (CGFloat)lengthWithSmall:(CGFloat)smallLength
                    medium:(CGFloat)mediumLength
                    normal:(CGFloat)normalLength
                     large:(CGFloat)largeLength;


@end
