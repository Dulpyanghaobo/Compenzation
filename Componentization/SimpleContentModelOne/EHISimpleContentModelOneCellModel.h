//
//  EHISimpleContentModelOneCellModel.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionCellItemProtocol.h"
@class EHISimpleContentModel;
NS_ASSUME_NONNULL_BEGIN

@interface EHISimpleContentModelOneCellModel : NSObject<SEEDCollectionCellItemProtocol>
@property (nonatomic, strong, readonly) NSString *titleStr;

@property (nonatomic, strong, readonly) NSString *imageUrl;

@property (nonatomic, strong, readonly) NSAttributedString *descAttrStr;
@property (nonatomic, strong, readonly) UIColor *bkColor;

@property (nonatomic, assign, readonly) UIRectCorner corner;

@property (nonatomic, assign, readonly) CGSize cornerRadii;

@property (nonatomic, assign, readonly) CGFloat imgWidth;

@property (nonatomic, assign, readonly) CGFloat imgHeight;

@property (nonatomic,copy) void(^titleDescImgBlock)(UILabel *title,UIImageView *img,UILabel *desc);
- (instancetype)initWithSimpleModel:(EHISimpleContentModel *)model corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii bkColor:(UIColor *)bkColor imgWidth:(CGFloat)imgWidth imgHeight:(CGFloat)imgHeight block:(void(^)(UILabel *title,UIImageView *image,UILabel *descStr))block;

@end

NS_ASSUME_NONNULL_END
