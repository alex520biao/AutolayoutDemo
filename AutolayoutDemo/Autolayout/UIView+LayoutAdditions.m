/**
 @version 1.00 2013/4/9 Creation
 @copyright Copyright (c) 2015 alex. All rights reserved.
 */

#import "UIView+LayoutAdditions.h"
#import <objc/runtime.h>
#import "FreeLayout.h"
#import "UIViewAdditions.h"
#import "UIView+FreeLayout.h"

@implementation UIView(UIView_LayoutAdditions)

#pragma mark - 实现insets
static const void *kPropertyKeyInsets = &kPropertyKeyInsets;
//@dynamic insets;
-(void)setInsets:(UIEdgeInsets)insets{
    NSValue *value = [NSValue valueWithUIEdgeInsets:insets];
    objc_setAssociatedObject(self, kPropertyKeyInsets, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)insets{
    NSValue *value = objc_getAssociatedObject(self, kPropertyKeyInsets);
    if (value) {
        return [value UIEdgeInsetsValue];
    }else{
        return UIEdgeInsetsZero;
    }
}

#pragma mark - 实现margins
static const void *kPropertyKeyMargins = &kPropertyKeyMargins;
//@dynamic margins;
-(void)setMargins:(UIEdgeInsets)margins{
    NSValue *value = [NSValue valueWithUIEdgeInsets:margins];
    objc_setAssociatedObject(self, kPropertyKeyMargins, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)margins{
    NSValue *value = objc_getAssociatedObject(self, kPropertyKeyMargins);
    if (value) {
        return [value UIEdgeInsetsValue];
    }else{
        return UIEdgeInsetsZero;
    }
}

#pragma mark - UIView的9个顶点
#warning 此处的Vertex表示的是subview的各个顶点针对frame的值
//左上顶点
-(void)setVertexLeftTop:(CGPoint)vertexLeftTop{
    self.left   = vertexLeftTop.x;
    self.top    = vertexLeftTop.y;
}

-(CGPoint) vertexLeftTop{
    CGPoint vertex = CGPointMake(self.left, self.top);
    return vertex;
}

//左中顶点
-(void)setVertexLeftCenter:(CGPoint)vertexLeftCenter{
    self.left = vertexLeftCenter.x;
    self.centerY = vertexLeftCenter.y;
}

-(CGPoint) vertexLeftCenter{
    CGPoint vertex = CGPointMake(self.left, self.centerY);
    return vertex;
}

//坐下顶点
-(void)setVertexLeftBottom:(CGPoint)vertexLeftBottom{
    self.left = vertexLeftBottom.x;
    self.bottom = vertexLeftBottom.y;
}

-(CGPoint) vertexLeftBottom{
    CGPoint vertex = CGPointMake(self.left, self.bottom);
    return vertex;
}

//右上顶点
-(void)setVertexRightTop:(CGPoint)vertexRightTop{
    self.right = vertexRightTop.x;
    self.top = vertexRightTop.y;
}

-(CGPoint) vertexRightTop{
    CGPoint vertex = CGPointMake(self.right, self.top);
    return vertex;
}

//右中顶点
-(void)setVertexRightCneter:(CGPoint)vertexRightCneter{
    self.right = vertexRightCneter.x;
    self.centerY = vertexRightCneter.y;
}

-(CGPoint) vertexRightCneter{
    CGPoint vertex = CGPointMake(self.right, self.centerY);
    return vertex;
}

//右下顶点
-(void)setVertexRightBottom:(CGPoint)vertexRightBottom{
    self.right = vertexRightBottom.x;
    self.bottom = vertexRightBottom.y;
}

-(CGPoint) vertexRightBottom{
    CGPoint vertex = CGPointMake(self.right, self.bottom);
    return vertex;
}

//中上顶点
-(void)setVertexCenterTop:(CGPoint)vertexCenterTop{
    self.centerX = vertexCenterTop.x;
    self.centerY = vertexCenterTop.y;
}

-(CGPoint) vertexCenterTop{
    CGPoint vertex = CGPointMake(self.centerX, self.top);
    return vertex;
}

//中中顶点
-(void)setVertexCenterCenter:(CGPoint)vertexCenterCenter{
    self.centerX = vertexCenterCenter.x;
    self.centerY = vertexCenterCenter.y;
}

-(CGPoint) vertexCenterCenter{
    CGPoint vertex = CGPointMake(self.centerX, self.centerY);
    return vertex;
}

//中下顶点
-(void)setVertexCenterBottom:(CGPoint)vertexCenterBottom{
    self.centerX = vertexCenterBottom.x;
    self.centerY = vertexCenterBottom.y;
}

-(CGPoint) vertexCenterBottom{
    CGPoint vertex = CGPointMake(self.centerX, self.bottom);
    return vertex;
}


#pragma mark - Other
//工作机制：通过当前View大小变化触发layoutSubviews方法，layoutSubviews中调用布局算法
//重新设置所有子控件Frame，当子控件大小发生变化时，循环触发此机制，达到递归调用布局算法的目的.

-(void)layoutSubviewsExt{
#warning freeLayout应该是一个集合,动画可控制
//    [UIView animateWithDuration:0.2
//                     animations:^{
//                         //freeLayout开始布局(freeLayout及其子类)
//                         if (self.freeLayout) {
//                             [self.freeLayout layout];
//                         }
//                     }];
    
    //freeLayout开始布局(freeLayout及其子类)
    if(self.layoutDict){
        for (FreeLayout *layout in self.layoutDict.allValues) {
            if (layout && [layout isKindOfClass:[FreeLayout class]]) {
                [layout layout];
            }
        }
    }
    
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
