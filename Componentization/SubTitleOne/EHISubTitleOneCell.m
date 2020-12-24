//
//  EHISubTitleOneCell.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//
/** 小标题模型
 1.左边小标题
 2.小标题在左边 右边是按钮
 3.小标题在中间
 */
#import "EHISubTitleOneCell.h"
#import "EHISubTitleOneCellModel.h"
/** 魔法效果扩充边界*/
#import "UIButton+SEEDExtension.h"

@interface EHISubTitleOneCell()
@property (nonatomic,strong) UIButton *rightButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) EHISubTitleOneCellModel *cellModel;
@end
@implementation EHISubTitleOneCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self p_setUpUI];
    }
    return self;
}

- (void)p_setUpUI {
    self.backgroundColor = EHIColor.clearColor;
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self);
        make.left.mas_offset(12);
        make.height.lessThanOrEqualTo(self);
    }];
    [self addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self);
        make.right.mas_offset(-12);
        make.height.lessThanOrEqualTo(self);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.cellModel.corner != 0) {
        UIBezierPath *superPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.cellModel.corner cornerRadii:self.cellModel.cornerRadii];
        CAShapeLayer *mainLayer = [[CAShapeLayer alloc] init];
        mainLayer.frame = self.bounds;
        mainLayer.path = superPath.CGPath;
        self.layer.mask = mainLayer;
    }
}

- (void)seed_cellWithData:(EHISubTitleOneCellModel *)itemModel {
    _cellModel = itemModel;
    self.backgroundColor = itemModel.bkColor;
    [self.titleLabel setText:itemModel.titleString];
    if (itemModel.labelUIlabelBtn) {
        itemModel.labelUIlabelBtn(self.titleLabel,self.rightButton);
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"这是一个副标题";
    }
    return _titleLabel;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.hidden = YES;
    }
    return _rightButton;
}
@end
