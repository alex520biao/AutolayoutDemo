/**
 @version 1.00 2013/4/9 Creation
 @copyright Copyright (c) 2015 alex. All rights reserved.
 */

#import "UIView+LayoutAdditions.h"
#import <objc/runtime.h>
#import "UIView+LinearLayout.h"
#import "UIView+FreeLayout.h"

@implementation UIView(UIView_LayoutAdditions)

//#pragma CUSLayout working mechanism
//CUSLayout 工作机制：通过当前View大小变化触发layoutSubviews方法，layoutSubviews中调用布局算法
//重新设置所有子控件Frame，当子控件大小发生变化时，循环触发此机制，达到递归调用布局算法的目的.

-(void)layoutSubviewsExt{
    //layoutSubviews
    [self floatReset];
    [self freeAnchorReset];

    //此方法已和layoutSubviews方法互换，并非调用自身，实际上是调用[super layoutSubviews]，所以不会引起死循环
    /* 调用[self layoutSubviews] */
    [self layoutSubviewsExt];
}

//IOS6中autoresizesSubviews的View必须调用UIView中的layoutSubviews，而Catogory覆盖的方法不能调用super中的方法
//因此将布局递归机制通过交换方法实现
+ (void) load{
    //在layoutSubviews
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod([UIView class], @selector(layoutSubviewsExt)), class_getInstanceMethod([self class], @selector(layoutSubviews)));
    });
}

@end
