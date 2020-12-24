//
//  EHISimpleContentModelOneCellModel.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "EHISimpleContentModelOneCellModel.h"
#import "EHISimpleContentModel.h"

@interface EHISimpleContentModelOneCellModel()

@property (nonatomic, strong) EHISimpleContentModel *model;

@property (nonatomic, strong) NSString *titleStr;

@property (nonatomic, strong) NSString *imageUrl;

@property (nonatomic, strong) NSAttributedString *descAttrStr;

@property (nonatomic, strong) UIColor *bkColor;

@property (nonatomic, assign) UIRectCorner corner;

@property (nonatomic, assign) CGSize cornerRadii;

@property (nonatomic, assign) CGFloat imgWidth;

@property (nonatomic, assign) CGFloat imgHeight;
@end

@implementation EHISimpleContentModelOneCellModel

- (instancetype)initWithSimpleModel:(EHISimpleContentModel *)model corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii bkColor:(UIColor *)bkColor imgWidth:(CGFloat)imgWidth imgHeight:(CGFloat)imgHeight block:(void(^)(UILabel *title,UIImageView *image,UILabel *descStr))block {
    self = [super init];
    if (self) {
        self.corner = corner;
        self.cornerRadii = cornerRadii;
        self.bkColor = bkColor;
        self.imgWidth = imgWidth;
        self.imgHeight = imgHeight;
        [self updateModel:model];
        self.titleDescImgBlock = block;
    };
    return self;
}
- (void)updateModel:(EHISimpleContentModel *)model {
    _model = model;
    self.titleStr = model.titleStr;
    self.imageUrl = model.imageUrl;
    self.descAttrStr = model.descAttrStr;
}
#pragma mark - SEEDCollectionCellItemProtocol
/// 对应cell的类
-(Class)seed_CellClass {
    return NSClassFromString(@"EHISimpleContentModelOneCell");
}

@synthesize seed_cellSize;

@synthesize seed_indexPath;

@synthesize seed_refreshCellBlock;

@synthesize seed_didSelectActionBlock;
@end
