//
//  EHISimpleContentModelSectionItem.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/28.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "EHISimpleContentModelSectionItem.h"
#import "EHISimpleContentModelTwoCellModel.h"
@interface EHISimpleContentModelSectionItem()

@end

@implementation EHISimpleContentModelSectionItem
- (instancetype)initWithModel:(NSArray<id<EHISimpleContentProtocol>> *)modelArray background:(UIColor *)background borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth block:(void(^)(UIView *view))block {
        if (self = [super init]) {
            self.seed_sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
            self.seed_horizontalSpacing = 0;
            self.seed_verticalSpacing = 0;
            self.seed_columnCount = modelArray.count;
            [self.seed_cellItems removeAllObjects];
            [modelArray enumerateObjectsUsingBlock:^(id<EHISimpleContentProtocol> _Nonnull obj ,NSUInteger idx,BOOL * _Nonnull stop){
            EHISimpleContentModelTwoCellModel *cellModel = [[EHISimpleContentModelTwoCellModel alloc]initWithModel:obj cellWidth:self.seed_cellWidth block:block];
            cellModel.backGroundColor = background;
            cellModel.borderColor = borderColor;
            cellModel.cornerRadius = cornerRadius;
            cellModel.borderWidth = borderWidth;
            [self.seed_cellItems addObject:cellModel];
                }];
            }
        return self;
}

@end
