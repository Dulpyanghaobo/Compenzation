//
//  EHISubTitleOneItem.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "SEEDCollectionVerticalSectionItem.h"
#import "EHISubTitleOneCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface EHISubTitleOneItem : SEEDCollectionVerticalSectionItem
@property (nonatomic, strong, readonly)EHISubTitleOneCellModel  *cellModel;
- (instancetype)initWithTitle:(NSString *)title corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii bkColor:(UIColor *)bkColor block:(void (^)(UILabel * lab, UIButton * btn))labelBtnUIblock;
@end

NS_ASSUME_NONNULL_END
