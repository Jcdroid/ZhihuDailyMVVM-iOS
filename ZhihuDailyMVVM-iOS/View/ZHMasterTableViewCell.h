//
//  ZHMasterTableViewCell.h
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CEReactiveView.h"

@interface ZHMasterTableViewCell : UITableViewCell <CEReactiveView>

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
