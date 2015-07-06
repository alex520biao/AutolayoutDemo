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

-(LineLayout*)initWithView:(UIView*)view
                      type:(LLType)type
                     block:(void(^)(LineLayout *layout))block{

    //每种LLType只能添加一个layout对象
    NSString *key = [NSString stringWithFormat:@"freeLayoutKeyLine%d",type];
    FLVertex startVertex = [self startVertexWithType:type];
    self = [super initWithKey:key view:view start:startVertex block:nil];
    if (self) {
        self.type = type;
        
        //设置lineLayoutItem参数
        if (block) {
            block(self);
        }
    }
    return self;
}

-(void)addLayoutItemWithSubview:(UIView *)subview{
    
    LayoutItem *item = [[LayoutItem alloc] init];
    item.subview = subview;
    item.layoutItemType = LayoutItemTypeSubview;
    
    LLType type = self.type;
    //(左上顶点,向下)轴,内侧
    if (type == LLTypeLeftTop_Down) {
        item.vertexBrfore = FLVertexLeftTop;
        item.vertexAfter  = FLVertexLeftBottom;
    }
    //(左上顶点,向右)轴,内侧
    else if (type == LLTypeLeftTop_Right) {
        item.vertexBrfore = FLVertexLeftTop;
        item.vertexAfter  = FLVertexRightTop;
    }
    //(左中顶点,向右)轴,中间
    else if (type == LLTypeLeftCenter_Right) {
        item.vertexBrfore = FLVertexLeftCenter;
        item.vertexAfter  = FLVertexRightCneter;
    }
    //(左下顶点,向上)轴,内侧
    else if (type == LLTypeLeftBottom_Up) {
        item.vertexBrfore = FLVertexLeftBottom;
        item.vertexAfter  = FLVertexLeftTop;
    }
    //(左下顶点,向右)轴,内侧
    else if (type == LLTypeLeftBottom_Right) {
        item.vertexBrfore = FLVertexLeftBottom;
        item.vertexAfter  = FLVertexRightBottom;
    }
    //(中上顶点,向下)轴,中间
    else if (type == LLTypeCenterTop_Down) {
        item.vertexBrfore = FLVertexCenterTop;
        item.vertexAfter  = FLVertexCenterBottom;
    }
    //(中下顶点,向上)轴,中间
    else if (type == LLTypeCenterBottom_Up) {
        item.vertexBrfore = FLVertexCenterBottom;
        item.vertexAfter  = FLVertexCenterTop;
    }
    //(右上顶点,向左)轴,内侧
    else if (type == LLTypeRightTop_Left) {
        item.vertexBrfore = FLVertexRightTop;
        item.vertexAfter  = FLVertexLeftTop;
    }
    //(右上顶点,向下)轴,内侧
    else if (type == LLTypeRightTop_Down) {
        item.vertexBrfore = FLVertexRightTop;
        item.vertexAfter  = FLVertexRightBottom;
    }
    //(右中顶点,向左)轴,中间
    else if (type == LLTypeRightCneter_Left) {
        item.vertexBrfore = FLVertexRightCneter;
        item.vertexAfter  = FLVertexLeftCenter ;
    }
    //(右下顶点,向上)轴,内侧
    else if (type == LLTypeRightBottom_Up) {
        item.vertexBrfore = FLVertexRightBottom;
        item.vertexAfter  = FLVertexRightTop;
    }
    //(右下顶点,向左)轴,内侧
    else if (type == LLTypeRightBottom_Left) {
        item.vertexBrfore = FLVertexRightBottom;
        item.vertexAfter  = FLVertexLeftBottom;
    }
    [self.layoutItemList addObject:item];
}

-(void)addLayoutItemWithSpacing:(CGFloat)spacing{
    
    LayoutItem *item = [[LayoutItem alloc] init];
    item.layoutItemType = LayoutItemTypeOffset;
    
    LLType type = self.type;
    UIOffset offset = UIOffsetZero;
    //(左上顶点,向下)轴,内侧
    if (type == LLTypeLeftTop_Down) {
        offset = UIOffsetMake(0, spacing);
    }
    //(左上顶点,向右)轴,内侧
    else if (type == LLTypeLeftTop_Right) {
        offset = UIOffsetMake(spacing,0);
    }
    //(左中顶点,向右)轴,中间
    else if (type == LLTypeLeftCenter_Right) {
        offset = UIOffsetMake(spacing, 0);
    }
    //(左下顶点,向上)轴,内侧
    else if (type == LLTypeLeftBottom_Up) {
        offset = UIOffsetMake(0, -spacing);
    }
    //(左下顶点,向右)轴,内侧
    else if (type == LLTypeLeftBottom_Right) {
        offset = UIOffsetMake(spacing, 0);
    }
    //(中上顶点,向下)轴,中间
    else if (type == LLTypeCenterTop_Down) {
        offset = UIOffsetMake(0, spacing);
    }
    //(中下顶点,向上)轴,中间
    else if (type == LLTypeCenterBottom_Up) {
        offset = UIOffsetMake(0, -spacing);
    }
    //(右上顶点,向左)轴,内侧
    else if (type == LLTypeRightTop_Left) {
        offset = UIOffsetMake(-spacing,0);
    }
    //(右上顶点,向下)轴,内侧
    else if (type == LLTypeRightTop_Down) {
        offset = UIOffsetMake(0, spacing);
    }
    //(右中顶点,向左)轴,中间
    else if (type == LLTypeRightCneter_Left) {
        offset = UIOffsetMake(-spacing, 0);
    }
    //(右下顶点,向上)轴,内侧
    else if (type == LLTypeRightBottom_Up) {
        offset = UIOffsetMake(0, -spacing);
    }
    //(右下顶点,向左)轴,内侧
    else if (type == LLTypeRightBottom_Left) {
        offset = UIOffsetMake(-spacing, 0);
    }
    item.offset = offset;
    [self.layoutItemList addObject:item];
}

-(LineLayout*)addLinelayoutSubview:(UIView *)subview
                           spacing:(CGFloat)spacing{
    
    if (subview) {
        //subview
        [self addLayoutItemWithSubview:subview];
        
        //spacing
        [self addLayoutItemWithSpacing:spacing];
    }
    return self;
}

#pragma mark - 包装Block
- (AddLineLayoutTupleBlock) linelayoutTuple{
    return ^(UIView *subview,CGFloat spacing) {
        
        //subview必须是view的子视图且未隐藏
        if(subview && [self.view.subviews containsObject:subview] && !subview.hidden){
            //subview
            [self addLayoutItemWithSubview:subview];
            
            //spacing
            [self addLayoutItemWithSpacing:spacing];
        }
        return self;
    };
}

- (AddLineLayoutSubviewBlock) lineLayoutSubview{
    return ^(UIView *subview) {
        
        //subview必须是view的子视图且未隐藏
        if(subview && [self.view.subviews containsObject:subview] && !subview.hidden){
            //subview
            [self addLayoutItemWithSubview:subview];
        }
        return self;
    };
}

- (AddLineLayoutSpacingBlock) lineLayoutSpacing{
    return ^(CGFloat spacing) {
        
        //spacing
        [self addLayoutItemWithSpacing:spacing];
        return self;
    };
}

#pragma mark - 私有方法
/*!
 *  @brief  根据LLType线性布局类型转换得到布局起始顶点
 *
 *  @param type 线性布局类型
 *
 *  @return
 */
-(FLVertex)startVertexWithType:(LLType)type{
    
    FLVertex startVertex = FLVertexLeftTop;
    //(左上顶点,向下)轴,内侧
    if (type == LLTypeLeftTop_Down) {
        startVertex = FLVertexLeftTop;
    }
    //(左上顶点,向右)轴,内侧
    else if (type == LLTypeLeftTop_Right) {
        startVertex = FLVertexLeftTop;
    }
    //(左中顶点,向右)轴,中间
    else if (type == LLTypeLeftCenter_Right) {
        startVertex = FLVertexLeftCenter;
    }
    //(左下顶点,向上)轴,内侧
    else if (type == LLTypeLeftBottom_Up) {
        startVertex = FLVertexLeftBottom;
    }
    //(左下顶点,向右)轴,内侧
    else if (type == LLTypeLeftBottom_Right) {
        startVertex = FLVertexLeftBottom;
    }
    //(中上顶点,向下)轴,中间
    else if (type == LLTypeCenterTop_Down) {
        startVertex = FLVertexCenterTop;
    }
    //(中下顶点,向上)轴,中间
    else if (type == LLTypeCenterBottom_Up) {
        startVertex = FLVertexCenterBottom;
    }
    //(右上顶点,向左)轴,内侧
    else if (type == LLTypeRightTop_Left) {
        startVertex = FLVertexRightTop;
    }
    //(右上顶点,向下)轴,内侧
    else if (type == LLTypeRightTop_Down) {
        startVertex = FLVertexRightTop;
    }
    //(右中顶点,向左)轴,中间
    else if (type == LLTypeRightCneter_Left) {
        startVertex = FLVertexRightCneter;
    }
    //(右下顶点,向上)轴,内侧
    else if (type == LLTypeRightBottom_Up) {
        startVertex = FLVertexRightBottom;
    }
    //(右下顶点,向左)轴,内侧
    else if (type == LLTypeRightBottom_Left) {
        startVertex = FLVertexRightBottom;
    }
    return startVertex;
}

/*!
 *  @brief  重写父类方法
 */
-(void)layout{
    [super layout];    
}


@end
