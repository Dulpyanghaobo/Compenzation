//
//  EHISimpleContentModelCellModel.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/28.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "EHISimpleContentModelTwoCellModel.h"
#import "EHISimpleContentCellModelProtocol.h"

@interface EHISimpleContentModelTwoCellModel()

@property (nonatomic,strong) id<EHISimpleContentProtocol>model;

@property (nonatomic,strong) id<EHISimpleContentProtocol>selectedModel;

/** 描述 */
@property (nonatomic, strong) id<EHISimpleContentCellModelProtocol> dealStrategy;

@property (nonatomic,assign) BOOL isSelected;
@end


@implementation EHISimpleContentModelTwoCellModel
- (instancetype)initWithModel:(id<EHISimpleContentProtocol>)model cellWidth:(CGFloat)cellWidth block:(void(^)(UIView *view))block {
    if (self = [super init]) {
        self.model = model;
        [self p_initData];
        self.viewBlock = block;
        self.seed_cellSize = CGSizeMake(cellWidth, 0);
    }
    return self;
}
#pragma mark - private
/// 默认数据
- (void)p_initData {
    EHiWeakSelf(self)
    self.seed_didSelectActionBlock = ^(__kindof NSObject<SEEDCollectionCellItemProtocol> * _Nonnull object) {
        EHiStrongSelf(self)
        if (self.didClickAction) {
            self.didClickAction(self.model);
        }
    };
}
#pragma mark - public
/// 更新模型
/// @param model 模型
- (void)updateModel:(id<EHISimpleContentProtocol>)model{
    self.selectedModel = model;
    /** 获取当前cellModel的状态*/
    EHISimpleContentState state = [self.dealStrategy getStateWithSelectedModel:model originModel:self.model];
    /** 根据当前状态设置View数据*/
//    [self p_dealData:state];
    
}
- (EHISimpleContentState)getStateWithSelectedModel:(id<EHISimpleContentProtocol>)selectedModel originModel:(id<EHISimpleContentProtocol>)originModel{
    return EHISimpleContentStateEnabled;
}

- (void)p_dealData:(EHISimpleContentState)state {
    self.selectedModel.isSelected = state;
    if (state == EHISimpleContentStateSelected ) {
    }
}

#pragma mark - SEEDCollectionCellItemProtocol
/// 对应cell的类
-(Class)seed_CellClass {
    return NSClassFromString(@"EHISimpleContentModelTwoCell");
}

@synthesize seed_cellSize;

@synthesize seed_indexPath;

@synthesize seed_refreshCellBlock;

@synthesize seed_didSelectActionBlock;
@end
