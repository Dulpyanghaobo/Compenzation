//
//  EHIContentModelCell.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/28.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "EHISimpleContentModelTwoCell.h"
#import "EHISimpleContentModelTwoCellModel.h"
@interface EHISimpleContentModelTwoCell()
/**textContentView背景View */
@property (strong, nonatomic) UIView *textContentView;
@property (nonatomic, strong) EHISimpleContentModelTwoCellModel *cellModel;


@end

@implementation EHISimpleContentModelTwoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self p_setUpUI];
    }
    return self;
}
- (void)p_setUpUI {
    [self.contentView addSubview:self.textContentView];
    [self.textContentView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)seed_cellWithData:(__kindof NSObject<SEEDCollectionCellItemProtocol> *)itemModel {
    self.cellModel = itemModel;
    self.contentView.backgroundColor = EHIColor.clearColor;
    self.layer.borderColor = self.cellModel.borderColor.CGColor;
    self.layer.cornerRadius = self.cellModel.cornerRadius;
    self.layer.borderWidth = self.cellModel.borderWidth;
    self.layer.masksToBounds = YES;
    self.cellModel.viewBlock(self);
    self.cellModel.selectedBlock(self);
    self.cellModel.originBlock(self);

}

- (UIView *)textContentView {
    if (!_textContentView) {
        _textContentView = [[UIView alloc]init];
        _textContentView.backgroundColor = EHIColor.clearColor;
    }
    return _textContentView;
}
@end
