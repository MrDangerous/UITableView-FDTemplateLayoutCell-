//
//  AutoLayoutCell.m
//  UITableView-FDTemplateLayoutCell使用
//
//  Created by 何凯楠 on 15/10/10.
//  Copyright (c) 2015年 何凯楠. All rights reserved.
//

#import "AutoLayoutCell.h"
#import "AutoLayoutCellModel.h"
#import "UIImageView+WebCache.h"

@interface AutoLayoutCell()

@property (nonatomic , strong) UIImageView *imgView;
@property (nonatomic , strong) UILabel     *introLabel;

@end

@implementation AutoLayoutCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (nil != self) {
        [self setupView];
    }
    
    return self;
}

- (void)setupView
{
    self.imgView                  = [UIImageView new];
    self.introLabel               = [UILabel new];
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.introLabel];
    self.introLabel.numberOfLines = 0;
    
    [self.imgView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(8);
        make.size.equalTo(CGSizeMake(60, 60));
        make.bottom.lessThanOrEqualTo(-8).priorityHigh();
    }];
    
    [self.introLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.right).offset(8);
        make.top.equalTo(self.imgView);
        make.right.equalTo(-8);
        make.bottom.equalTo(-8);
    }];
}

- (void)setModel:(AutoLayoutCellModel *)model
{
    _model = model;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.introLabel.text = model.intro;
}


@end
