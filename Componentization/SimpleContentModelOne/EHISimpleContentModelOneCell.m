//
//  EHISimpleContentmodelOneCell.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "EHISimpleContentModelOneCell.h"
#import "EHISimpleContentModelOneCellModel.h"
#import "UIImageView+WebCache.h"

@interface EHISimpleContentModelOneCell()

@property (nonatomic,strong)UIImageView *leftImage;

@property (nonatomic,strong)UILabel *title;

@property (nonatomic,strong)UILabel *descLabel;

@property (nonatomic,strong)EHISimpleContentModelOneCellModel *cellModel;
@end

@implementation EHISimpleContentModelOneCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self p_setUpUI];
    }
    return self;
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
- (void)p_setUpUI {
    self.backgroundColor = EHIColor.clearColor;
    [self addSubview:self.leftImage];
    [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self);
        make.left.mas_offset(12);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    [self addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.leftImage);
        make.left.equalTo(self.leftImage.mas_right).offset(12);
        make.right.lessThanOrEqualTo(self).offset(-12);
        make.height.mas_equalTo(20);

    }];
    [self addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.right.equalTo(self.title);
        make.bottom.equalTo(self.leftImage);
        make.top.lessThanOrEqualTo(self.title.mas_bottom).offset(12);
        make.height.mas_equalTo(20);

    }];

}

- (void)seed_cellWithData:(EHISimpleContentModelOneCellModel *)itemModel {
    _cellModel = itemModel;
    [self.leftImage sd_setImageWithURL:[NSURL URLWithString:itemModel.imageUrl] placeholderImage:nil];
    self.title.text = itemModel.titleStr;
    self.backgroundColor= itemModel.bkColor;
    self.descLabel.attributedText = itemModel.descAttrStr;
    [self updateUI];
    if (itemModel.titleDescImgBlock) {
        itemModel.titleDescImgBlock(self.title, self.leftImage, self.descLabel);
    }
}
- (void)updateUI {
    [self.leftImage mas_updateConstraints:^(MASConstraintMaker *make){
        make.width.mas_equalTo(self.cellModel.imgWidth);
        make.height.mas_equalTo(self.cellModel.imgHeight);
    }];
}
- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.text = @"大标题";
        _title.numberOfLines = 2;
        _title.font = BoldFONT(18);
    }
    return _title;
}
- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = FONT(12);
        _descLabel.textColor = EHIColor.hexColor_F5F5F5_fitDark_010101;
        _descLabel.numberOfLines = 2;
    }
    return _descLabel;
    
}
- (UIImageView *)leftImage {
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc] init];
        _leftImage.layer.cornerRadius = 12;
    }
    return _leftImage;
}

@end
