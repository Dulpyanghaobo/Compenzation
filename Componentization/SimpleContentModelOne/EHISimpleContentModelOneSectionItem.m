//
//  EHISimpleContentModelOneSectionItem.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "EHISimpleContentModelOneSectionItem.h"
#import "EHISimpleContentModel.h"
@interface EHISimpleContentModelOneSectionItem()

@property (nonatomic,strong) EHISimpleContentModelOneCellModel *cellModel;
@end

@implementation EHISimpleContentModelOneSectionItem
- (instancetype)initWithModel:(EHISimpleContentModel *)model corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii bkColor:(UIColor *)bkColor imgWidth:(CGFloat)imgWidth imgHeight:(CGFloat)imgHeight block:(void(^)(UILabel *title,UIImageView *image,UILabel *descStr))block {
    if (self = [super init]) {
        self.seed_sectionInset = UIEdgeInsetsMake(0, 12, 1, 12);
        self.seed_horizontalSpacing = 0;
        self.seed_verticalSpacing = 0;
        self.seed_columnCount = 1;
        EHISimpleContentModelOneCellModel *cellModel = [[EHISimpleContentModelOneCellModel alloc]initWithSimpleModel:model corner:corner cornerRadii:cornerRadii bkColor:bkColor imgWidth:imgWidth imgHeight:imgHeight block:block];
        self.cellModel = cellModel;
        [self.seed_cellItems addObject:self.cellModel];
        }
    return self;
    }
@end
