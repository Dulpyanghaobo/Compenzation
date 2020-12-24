//
//  EHISubTitleOneItem.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "EHISubTitleOneItem.h"
@interface EHISubTitleOneItem ()
@property (nonatomic, strong)EHISubTitleOneCellModel  *cellModel;


@end


@implementation EHISubTitleOneItem

- (instancetype)initWithTitle:(NSString *)title corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii bkColor:(UIColor *)bkColor block:(void (^)(UILabel * lab, UIButton * btn))labelBtnUIblock {
    if (self = [super init]) {
        self.seed_sectionInset = UIEdgeInsetsMake(0, 12, 0, 12);
        self.seed_horizontalSpacing = 0;
        self.seed_verticalSpacing = 0;
        self.seed_columnCount = 1;
        EHISubTitleOneCellModel *cellModel = [[EHISubTitleOneCellModel alloc]initWithSubTitle:title corner:corner cornerRadii:cornerRadii bkColor:(UIColor *)bkColor block:labelBtnUIblock];
        self.cellModel = cellModel;
        [self.seed_cellItems addObject:cellModel];
    }
    return self;
}
@end
