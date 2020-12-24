//
//  EHISimpleContentModel.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EHISimpleContentModel : NSObject
@property (nonatomic, strong) NSString *titleStr;

@property (nonatomic, strong) NSString *imageUrl;

@property (nonatomic, strong) NSAttributedString *descAttrStr;

@end

NS_ASSUME_NONNULL_END
