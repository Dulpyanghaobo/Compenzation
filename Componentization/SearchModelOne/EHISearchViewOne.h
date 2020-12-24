//
//  EHISearchViewOne.h
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import <UIKit/UIKit.h>
//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}
NS_ASSUME_NONNULL_BEGIN

@interface EHISearchViewOne : UIView
//单例一个类
SINGLETON_FOR_HEADER(EHISearchViewOne)
/**
 是否是搜索状态
 */
@property (nonatomic, assign) BOOL isSearch;

/**
 占位placeholder
 */
@property (nonatomic, copy) NSString *placeholder;

/**
 光标颜色
 */
@property (nonatomic, strong) UIColor *tintColor;

/**
 SearchViewBlock传值
 */
@property (nonatomic, copy) SelectedCallBack callBack;
+ (instancetype)setSearchBarWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
