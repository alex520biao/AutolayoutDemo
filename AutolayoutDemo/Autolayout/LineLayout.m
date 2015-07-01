//
//  LineLayout.m
//  AutolayoutDemo
//
//  Created by liubiao on 15/6/30.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "LineLayout.h"
#import "UIViewAdditions.h"
#import "LayoutItem.h"
#import "UIView+LayoutAdditions.h"

@implementation LineLayout

-(instancetype)initWithView:(UIView*)view type:(LLType)type{
    self = [super init];
    if (self) {
        self.type = type;
        self.view = view;
    }
    return self;
}

-(void)linelayoutFreeAnchor:(LLType)type view:(UIView*)view{
    CGPoint freeAnchor = self.freeAnchor;
    
    //(左上顶点,向下)轴,内侧
    if (type == LLTypeLeftTop_Down) {
        freeAnchor.x = view.insets.left;
        freeAnchor.y = view.insets.top;
    }
    //(左上顶点,向右)轴,内侧
    else if (type == LLTypeLeftTop_Right) {
        freeAnchor.x = view.insets.left;
        freeAnchor.y = view.insets.top;
    }
    //(左中顶点,向右)轴,中间
    else if (type == LLTypeLeftCenter_Right) {
        freeAnchor.x = view.insets.left;
        freeAnchor.y = CGRectGetMidY(view.bounds);
    }
    //(左下顶点,向上)轴,内侧
    else if (type == LLTypeLeftBottom_Up) {
        freeAnchor.x = view.insets.left;
        freeAnchor.y = view.height - view.insets.bottom;
    }
    //(左下顶点,向右)轴,内侧
    else if (type == LLTypeLeftBottom_Right) {
        freeAnchor.x = view.insets.left;
        freeAnchor.y = view.height - view.insets.bottom;
    }
    //(中上顶点,向下)轴,中间
    else if (type == LLTypeCenterTop_Down) {
        freeAnchor.x = CGRectGetMidX(view.bounds);
        freeAnchor.y = view.insets.top;
    }
    //(中下顶点,向上)轴,中间
    else if (type == LLTypeCenterBottom_Up) {
        freeAnchor.x = CGRectGetMidX(view.bounds);
        freeAnchor.y = view.height - view.insets.bottom;
    }
    //(右上顶点,向左)轴,内侧
    else if (type == LLTypeRightTop_Left) {
        freeAnchor.x = view.width - view.insets.right;
        freeAnchor.y = view.insets.top;
    }
    //(右上顶点,向下)轴,内侧
    else if (type == LLTypeRightTop_Down) {
        freeAnchor.x = view.width - view.insets.right;
        freeAnchor.y = view.insets.top;
    }
    //(右中顶点,向左)轴,中间
    else if (type == LLTypeRightCneter_Left) {
        freeAnchor.x = view.width - view.insets.right;
        freeAnchor.y = CGRectGetMidY(view.bounds);
    }
    //(右下顶点,向上)轴,内侧
    else if (type == LLTypeRightBottom_Up) {
        freeAnchor.x = view.width - view.insets.right;
        freeAnchor.y = view.height - view.insets.bottom;
    }
    //(右下顶点,向左)轴,内侧
    else if (type == LLTypeRightBottom_Left) {
        freeAnchor.x = view.width - view.insets.right;
        freeAnchor.y = view.height - view.insets.bottom;
    }
    
    self.freeAnchor = freeAnchor;
}

-(LineLayout*)linelayoutSubview:(UIView *)subview
                        spacing:(CGFloat)spacing{

    return [self linelayoutSubview:subview type:self.type spacing:spacing];
}

-(LineLayout*)linelayoutSubview:(UIView *)subview
                      type:(LLType)type
                    spacing:(CGFloat)spacing{
    
    //(左上顶点,向下)轴,内侧
    if (type == LLTypeLeftTop_Down) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftTop
                    vertexAfter:FLVertexLeftBottom
                         offset:UIOffsetMake(0, spacing)];
    }
    //(左上顶点,向右)轴,内侧
    else if (type == LLTypeLeftTop_Right) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftTop
                    vertexAfter:FLVertexRightTop
                         offset:UIOffsetMake(spacing,0)];
    }
    //(左中顶点,向右)轴,中间
    else if (type == LLTypeLeftCenter_Right) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftCenter
                    vertexAfter:FLVertexRightCneter
                         offset:UIOffsetMake(spacing, 0)];
    }
    //(左下顶点,向上)轴,内侧
    else if (type == LLTypeLeftBottom_Up) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftBottom
                    vertexAfter:FLVertexLeftTop
                         offset:UIOffsetMake(0, -spacing)];
    }
    //(左下顶点,向右)轴,内侧
    else if (type == LLTypeLeftBottom_Right) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexLeftBottom
                    vertexAfter:FLVertexRightBottom
                         offset:UIOffsetMake(spacing, 0)];
    }
    //(中上顶点,向下)轴,中间
    else if (type == LLTypeCenterTop_Down) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexCenterTop
                    vertexAfter:FLVertexCenterBottom
                         offset:UIOffsetMake(0, spacing)];
    }
    //(中下顶点,向上)轴,中间
    else if (type == LLTypeCenterBottom_Up) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexCenterBottom
                    vertexAfter:FLVertexCenterTop
                         offset:UIOffsetMake(0, -spacing)];
    }
    //(右上顶点,向左)轴,内侧
    else if (type == LLTypeRightTop_Left) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexRightTop
                    vertexAfter:FLVertexLeftTop
                         offset:UIOffsetMake(-spacing,0)];
    }
    //(右上顶点,向下)轴,内侧
    else if (type == LLTypeRightTop_Down) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexRightTop
                    vertexAfter:FLVertexRightBottom
                         offset:UIOffsetMake(0, spacing)];
    }
    //(右中顶点,向左)轴,中间
    else if (type == LLTypeRightCneter_Left) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexRightCneter
                    vertexAfter:FLVertexLeftCenter
                         offset:UIOffsetMake(-spacing, 0)];
    }
    //(右下顶点,向上)轴,内侧
    else if (type == LLTypeRightBottom_Up) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexRightBottom
                    vertexAfter:FLVertexRightTop
                         offset:UIOffsetMake(0, -spacing)];
    }
    //(右下顶点,向左)轴,内侧
    else if (type == LLTypeRightBottom_Left) {
        [self freelayoutSubview:subview
                   vertexBrfore:FLVertexRightBottom
                    vertexAfter:FLVertexLeftBottom
                         offset:UIOffsetMake(-spacing, 0)];
    }
    return self;
}

- (LineLayoutItemBlock) linelayoutItem{
    return ^(UIView *subview,CGFloat spacing) {
        
        //subview必须是view的子视图
        if(subview && [self.view.subviews containsObject:subview]){
            LayoutItem *item = [[LayoutItem alloc] init];
            item.subview = subview;
            item.spacing = spacing;
            [self.layoutItemList addObject:item];
        }
        return self;
    };
}

-(void)layout{    
    if(self.view && self.layoutItemList.count>0){
        //重置freeAnchor标识
        [self linelayoutFreeAnchor:self.type view:self.view];
        
        for (int i=0; i<self.layoutItemList.count; i++) {
            LayoutItem *item =[self.layoutItemList objectAtIndex:i];
            if (item.subview) {
                [self linelayoutSubview:item.subview type:self.type spacing:item.spacing];
            }
        }
    }
}


@end
