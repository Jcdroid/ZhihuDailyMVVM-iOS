//
//  ZHMasterTableViewCell.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHMasterTableViewCell.h"

// View Model
#import "ZHLastestNewsViewModel.h"

@implementation ZHMasterTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindViewModel:(ZHLastestNewsViewModel *)viewModel {
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:viewModel.images[0]]];
    self.titleLabel.text = viewModel.title;
    /*因为此处不需要监听viewModel的变化，所以要直接给View赋ViewModel中的值
    @weakify(self);
    [RACObserve(viewModel, images) subscribeNext:^(id x) {
        @strongify(self);
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:x[0]]];
    }];
    RAC(self.titleLabel, text) = RACObserve(viewModel, title);
     */
}

@end
