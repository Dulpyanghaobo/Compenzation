//
//  EHISubTitleOneCellModel.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEEDCollectionCellItemProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface EHISubTitleOneCellModel : NSObject<SEEDCollectionCellItemProtocol>

@property (nonatomic, strong, readonly) NSString *titleString;

@property (nonatomic, strong, readonly) UIColor *bkColor;

@property (nonatomic, assign, readonly) UIRectCorner corner;

@property (nonatomic, assign, readonly) CGSize cornerRadii;



@property (nonatomic,copy) void(^labelUIlabelBtn)(UILabel *lab,UIButton *btn);

- (instancetype)initWithSubTitle:(NSString *)title corner:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii bkColor:(UIColor *)bkColor block:(void(^)(UILabel *lab,UIButton *btn))block;

@end

NS_ASSUME_NONNULL_END
