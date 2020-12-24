//
//  EHISimpleContentProtocol.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/28.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN



@protocol EHISimpleContentProtocol <NSObject>
@required

//选项Id
@property (nonatomic,assign) NSUInteger Id;

/** cell对象*/
@property (nonatomic,strong) NSObject *obj;

/** 是否被选中*/
@property (nonatomic,assign) BOOL isSelected;


@end

NS_ASSUME_NONNULL_END
