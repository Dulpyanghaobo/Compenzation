//
//  EHISimpleContentModelCellModel.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/28.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionCellItemProtocol.h"
#import "EHISimpleContentProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface EHISimpleContentModelTwoCellModel : NSObject<SEEDCollectionCellItemProtocol>
/** 背景颜色 */
@property (nonatomic, strong) UIColor *backGroundColor;

/** 边框颜色 */
@property (nonatomic, strong) UIColor *borderColor;

/** <#描述#> */
@property (nonatomic, assign) CGFloat cornerRadius;

/**  */
@property (nonatomic, assign) CGFloat borderWidth;

@property (nonatomic,copy)void(^selectedBlock)(UIView *view);

@property (nonatomic,copy)void(^originBlock)(UIView *view);

@property (nonatomic,copy)void(^viewBlock)(UIView *textView);

/** 点击回调 */
@property (nonatomic, copy) void(^didClickAction)(id<EHISimpleContentProtocol> objc);
- (instancetype)initWithModel:(id<EHISimpleContentProtocol>)model cellWidth:(CGFloat)cellWidth block:(void(^)(UIView *view))block;
@end

NS_ASSUME_NONNULL_END
