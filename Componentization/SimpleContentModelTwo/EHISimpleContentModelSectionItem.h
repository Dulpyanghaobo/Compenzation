//
//  EHISimpleContentModelSectionItem.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/28.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "SEEDCollectionVerticalSectionItem.h"
#import "EHISimpleContentProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface EHISimpleContentModelSectionItem : SEEDCollectionVerticalSectionItem
- (instancetype)initWithModel:(NSArray<id<EHISimpleContentProtocol>> *)modelArray background:(UIColor *)background borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth block:(void(^)(UIView *view))block;
@end

NS_ASSUME_NONNULL_END
