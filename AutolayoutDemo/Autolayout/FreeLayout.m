//
//  FreeLayout.m
//  AutolayoutDemo
//
//  Created by alex520biao on 15/6/30.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "FreeLayout.h"
#import "UIViewAdditions.h"
#import "LayoutItem.h"
#import "UIView+LayoutAdditions.h"

@implementation FreeLayout

/*!
 *  @brief  创建FreeLayout对象
 *
 *  @param layoutKey   layout对象唯一标识符
 *  @param view        layout对应的父视图
 *  @param startVertex layout布局起始顶点
 *  @param block       LayoutItem初始化block
 *
 *  @return
 */
-(instancetype)initWithKey:(NSString*)layoutKey
                      view:(UIView*)view
                     start:(FLVertex)startVertex
                     block:(void(^)(FreeLayout *layout))block{
    //layoutKey不能为空
    if (layoutKey && layoutKey.length>0) {
        self = [super init];
        if (self) {
            _layoutKey = layoutKey;
            _view = view;
            _startVertex = startVertex;
            
            //使用block继续初始化layoutItem
            if (block) {
                block(self);
            }
        }
        return self;
    }else{
        return nil;
    }
}

-(NSMutableArray*)layoutItemList{
    if (!_layoutItemList) {
        _layoutItemList = [[NSMutableArray alloc] init];
    }
    return _layoutItemList;
}

/*!
 *  @brief  根据view的startVertex布局起点重置freeAnchor锚点位置
 */
-(void)freeAnchorResetWithStartVertex{
    CGPoint point = CGPointZero;
    //此处startVertex表示self.view自身坐标系bounds中的顶点
    if (self.view) {        
        //左上顶点
        if (self.startVertex == FLVertexLeftTop) {
            point.x = self.view.insets.left;
            point.y = self.view.insets.top;
        }
        //左中顶点
        else if (self.startVertex == FLVertexLeftCenter){
            point.x = self.view.insets.left;
            point.y = CGRectGetMidY(self.view.bounds);
        }
        //左下顶点
        else if (self.startVertex == FLVertexLeftBottom){
            point.x = self.view.insets.left;
            point.y = self.view.height - self.view.insets.bottom;
        }
        //右上顶点
        else if (self.startVertex == FLVertexRightTop){
            point.x = self.view.width - self.view.insets.right;
            point.y = self.view.insets.top;
        }
        //右中顶点
        else if (self.startVertex == FLVertexRightCneter){
            point.x = self.view.width - self.view.insets.right;
            point.y = CGRectGetMidY(self.view.bounds);;
        }
        //右下顶点
        else if (self.startVertex == FLVertexRightBottom){
            point.x = self.view.width - self.view.insets.right;
            point.y = self.view.height - self.view.insets.bottom;
        }
        //中上顶点
        else if (self.startVertex == FLVertexCenterTop){
            point.x = CGRectGetMidX(self.view.bounds);
            point.y = self.view.insets.top;
        }
        //中中顶点
        else if (self.startVertex == FLVertexCenterCenter){
            point.x = CGRectGetMidX(self.view.bounds);
            point.y = CGRectGetMidY(self.view.bounds);
        }
        //中下顶点
        else if (self.startVertex == FLVertexCenterBottom){
            point.x = CGRectGetMidX(self.view.bounds);
            point.y = self.view.height - self.view.insets.bottom;
        }
    }
    self.freeAnchor = point;
}

-(FreeLayout*)freelayoutFreeAnchor:(CGPoint)freeAnchor{
    self.freeAnchor = freeAnchor;
    
    return self;
}

-(FreeLayout*)freelayoutOffset:(UIOffset)offset{
    CGPoint freeAnchor = self.freeAnchor;
    freeAnchor.x = freeAnchor.x + offset.horizontal;
    freeAnchor.y = freeAnchor.y + offset.vertical;
    self.freeAnchor = freeAnchor;
    
    return self;
}

/*!
 *  @brief  对subview自动布局。根据vertexBrfore修改subview
 *
 */
-(FreeLayout*)freelayoutSubview:(UIView *)subview
               vertexBrfore:(FLVertex)vertexBrfore{
    CGPoint freeAnchor = self.freeAnchor;
    
    //左上顶点
    if(vertexBrfore == FLVertexLeftTop){
        subview.vertexLeftTop = freeAnchor;
    }
    //左中顶点
    else if (vertexBrfore == FLVertexLeftCenter){
        //将subview的左下顶点设置为freeAnchor
        subview.vertexLeftCenter = freeAnchor;
    }
    //左下顶点
    else if (vertexBrfore == FLVertexLeftBottom){
        subview.vertexLeftBottom = freeAnchor;
    }
    //右上顶点
    else if (vertexBrfore == FLVertexRightTop){
        subview.vertexRightTop = freeAnchor;
    }
    //右中顶点
    else if (vertexBrfore == FLVertexRightCneter){
        subview.vertexRightCneter = freeAnchor;
    }
    //右下顶点
    else if (vertexBrfore == FLVertexRightBottom){
        subview.vertexRightBottom = freeAnchor;
    }
    //中上顶点
    else if (vertexBrfore == FLVertexCenterTop){
        subview.vertexCenterTop = freeAnchor;
    }
    //中中顶点
    else if (vertexBrfore == FLVertexCenterCenter){
        subview.vertexCenterCenter = freeAnchor;
    }
    //中下顶点
    else if (vertexBrfore == FLVertexCenterBottom){
        subview.vertexCenterBottom = freeAnchor;
    }
    
    return self;
}

/*!
 *  @brief  移动锚点位置到subview的vertexAfter
 *
 */
-(FreeLayout*)freelayoutSubview:(UIView *)subview
                    vertexAfter:(FLVertex)vertexAfter{
    
    CGPoint freeAnchor = self.freeAnchor;
    
    //根据vertexAfter修改freeAnchor位置
    //左上顶点
    if(vertexAfter == FLVertexLeftTop){
        freeAnchor = subview.vertexLeftTop;
    }
    //左中顶点
    else if (vertexAfter == FLVertexLeftCenter){
        freeAnchor = subview.vertexLeftCenter;
    }
    //左下顶点
    else if (vertexAfter == FLVertexLeftBottom){
        freeAnchor = subview.vertexLeftBottom;
    }
    //右上顶点
    else if (vertexAfter == FLVertexRightTop){
        freeAnchor = subview.vertexRightTop;
    }
    //右中顶点
    else if (vertexAfter == FLVertexRightCneter){
        freeAnchor = subview.vertexRightCneter;
    }
    //右下顶点
    else if (vertexAfter == FLVertexRightBottom){
        freeAnchor = subview.vertexRightBottom;
    }
    //中上顶点
    else if (vertexAfter == FLVertexCenterTop){
        freeAnchor = subview.vertexCenterTop;
    }
    //中中顶点
    else if (vertexAfter == FLVertexCenterCenter){
        freeAnchor = subview.vertexCenterCenter;
    }
    //中下顶点
    else if (vertexAfter == FLVertexCenterBottom){
        freeAnchor = subview.vertexCenterBottom;
    }
    self.freeAnchor = freeAnchor;
    
    return self;
}

-(FreeLayout*)freelayoutSubview:(UIView *)subview
                   vertexBrfore:(FLVertex)vertexBrfore
                    vertexAfter:(FLVertex)vertexAfter{
    //subview必须是self.view的子视图
    if (subview && [self.view.subviews containsObject:subview] && !subview.hidden) {
        //根据vertexBrfore修改subview位置
        [self freelayoutSubview:subview vertexBrfore:vertexBrfore];
        
        //根据vertexAfter修改freeAnchor位置
        [self freelayoutSubview:subview vertexAfter:vertexAfter];
    }
    return self;
}

-(FreeLayout*)freelayoutItem:(LayoutItem *)layoutItem{
    //subview
    if(layoutItem.layoutItemType == LayoutItemTypeSubview){
        //只有view上的显示的subview才允许参与布局
        if(layoutItem.subview && [self.view.subviews containsObject:layoutItem.subview] && !layoutItem.subview.hidden){

            [self freelayoutSubview:layoutItem.subview
                       vertexBrfore:layoutItem.vertexBrfore
                        vertexAfter:layoutItem.vertexAfter];
        }
    }
    //offset
    else if (layoutItem.layoutItemType == LayoutItemTypeOffset){
        [self freelayoutOffset:layoutItem.offset];
    }
    
    return self;
}



#pragma mark - layout
/*!
 *  @brief  使用view、subview进行布局 子类需要重写此方法。不要直接调用。
 *
 */
-(void)layout{
    if(self.view && self.layoutItemList.count>0){
        //重置freeAnchor标识
        [self freeAnchorResetWithStartVertex];

        for (int i=0; i<self.layoutItemList.count; i++) {
            LayoutItem *item =[self.layoutItemList objectAtIndex:i];
            //subviwe
            if (item.layoutItemType == LayoutItemTypeSubview) {
                [self freelayoutSubview:item.subview
                           vertexBrfore:item.vertexBrfore
                            vertexAfter:item.vertexAfter];
            }
            //offset
            else if (item.layoutItemType == LayoutItemTypeOffset){
                [self freelayoutOffset:item.offset];
            }
        }
    }
}

- (AddFreeLayoutSubviewBlock) freeLayoutSubview{
    return ^(UIView *subview,FLVertex vertexBrfore,FLVertex vertexAfter) {
        
        //subview必须是view的子视图
        if(subview && [self.view.subviews containsObject:subview]){
            //subview
            LayoutItem *subviewItem = [[LayoutItem alloc] init];
            subviewItem.layoutItemType = LayoutItemTypeSubview;
            subviewItem.subview = subview;
            subviewItem.vertexBrfore = vertexBrfore;
            subviewItem.vertexAfter = vertexAfter;
            [self.layoutItemList addObject:subviewItem];
        }
        return self;
    };
}

- (AddFreeLayoutOffsetBlock) freeLayoutOffset{
    return ^(UIOffset offset) {
        
        //subview
        LayoutItem *subviewItem = [[LayoutItem alloc] init];
        subviewItem.layoutItemType = LayoutItemTypeOffset;
        subviewItem.offset = offset;
        [self.layoutItemList addObject:subviewItem];
        return self;
    };
}


@end
