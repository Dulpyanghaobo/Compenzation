//
//  EHISimpleContentCellModelProtocol.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/28.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EHISimpleContentProtocol.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,EHISimpleContentState) {
    EHISimpleContentStateSelected,    //!> 选中
    EHISimpleContentStateEnabled,      //!> 正常
};
@protocol EHISimpleContentCellModelProtocol <NSObject>
- (EHISimpleContentState)getStateWithSelectedModel:(id<EHISimpleContentProtocol>)selectedModel originModel:(id<EHISimpleContentProtocol>)originModel;
- (void)getSelectedStatus;
- (void)getOriginStatus;
@end

NS_ASSUME_NONNULL_END
