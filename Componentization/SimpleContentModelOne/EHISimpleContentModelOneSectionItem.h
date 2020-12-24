//
//  EHISimpleContentModelOneSectionItem.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionVerticalSectionItem.h"
#import "EHISimpleContentModelOneCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface EHISimpleContentModelOneSectionItem : SEEDCollectionVerticalSectionItem
@property (nonatomic, strong, readonly)EHISimpleContentModelOneCellModel  *cellModel;

- (instancetype)initWithModel:(EHISimpleContentModel *)model corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii bkColor:(UIColor *)bkColor imgWidth:(CGFloat)imgWidth imgHeight:(CGFloat)imgHeight block:(void(^)(UILabel *title,UIImageView *image,UILabel *descStr))block;
@end

NS_ASSUME_NONNULL_END
