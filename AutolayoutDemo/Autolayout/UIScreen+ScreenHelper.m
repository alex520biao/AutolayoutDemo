//
//  UIScreen+ScreenHelper.m
//  DiCarpool
//
//  Created by alex520biao on 15/6/12.
//  Copyright (c) 2015年 DiDi. All rights reserved.
//

#import "UIScreen+ScreenHelper.h"

@implementation UIScreen (ScreenHelper)

#pragma mark - screenSize
+ (UIScreenSizeType)screenSizeType{
    int screenWidth  = [UIScreen mainScreen].bounds.size.width;
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIScreenSizeType screenSizeType = UIScreenSizeType_Normal;
    // 320*480及以下 iPhone4s及其以前设备
    if (screenWidth == 320 && screenHeight == 480) {
        screenSizeType = UIScreenSizeType_Small;
    }
    // 320*568      iPhone5/5C/5S
    else if (screenWidth == 320 && screenHeight == 568){
        screenSizeType = UIScreenSizeType_Medium;
    }
    // 375*667      iPhone6
    else if (screenWidth == 375 && screenHeight == 667 ){
        screenSizeType = UIScreenSizeType_Normal;
    }
    // 414*736及更大 iPhone6+及其更大
    else if (screenWidth >= 414 && screenHeight >= 736){
        screenSizeType = UIScreenSizeType_Large;
    }
    
    //    NSLog(@"screenWidth:%d,screenHeight:%d",screenWidth,screenHeight);
    //    NSLog(@"screenSizeType:%ld",(long int)screenSizeType);
    return screenSizeType;
}

+ (CGFloat)lengthWithSmall:(CGFloat)smallLength
                    medium:(CGFloat)mediumLength
                    normal:(CGFloat)normalLength
                     large:(CGFloat)largeLength{
    UIScreenSizeType screenSizeType = [UIScreen screenSizeType];
    CGFloat length = normalLength;
    switch (screenSizeType) {
        case UIScreenSizeType_Small:{
            length = smallLength;
            break;
        }
        case UIScreenSizeType_Medium:{
            length = mediumLength;
            break;
        }
        case UIScreenSizeType_Normal:{
            length = normalLength;
            break;
        }
        case UIScreenSizeType_Large:{
            length = largeLength;
            break;
        }
        default:{
            length = normalLength;
            break;
        }
    }
    return length;
}

@end
