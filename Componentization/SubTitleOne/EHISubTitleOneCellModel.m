//
//  EHISubTitleOneCellModel.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "EHISubTitleOneCellModel.h"
@interface EHISubTitleOneCellModel ()
@property (nonatomic, strong) NSString *titleString;

@property (nonatomic,strong) UIColor *bkColor;

@property (nonatomic, assign) UIRectCorner corner;

@property (nonatomic, assign) CGSize cornerRadii;

@end
@implementation EHISubTitleOneCellModel

- (instancetype)initWithSubTitle:(NSString *)title corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii bkColor:(UIColor *)bkColor block:(void(^)(UILabel *lab,UIButton *btn))block {
    self = [super init];
    if (self) {
        self.titleString = title;
        self.corner = corner;
        self.cornerRadii = cornerRadii;
        self.labelUIlabelBtn = block;
        self.bkColor = bkColor;
    };
    return self;
}


#pragma mark - SEEDCollectionCellItemProtocol
/// 对应cell的类
-(Class)seed_CellClass {
    return NSClassFromString(@"EHISubTitleOneCell");
}

@synthesize seed_cellSize;

@synthesize seed_indexPath;

@synthesize seed_refreshCellBlock;

@synthesize seed_didSelectActionBlock;
@end
