//
//  ZHLastestNewsViewModel.h
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import <ReactiveViewModel/ReactiveViewModel.h>

@class ZHNewsContentViewModel;

@interface ZHLastestNewsViewModel : RVMViewModel

@property (readonly, strong, nonatomic) NSNumber *id;
@property (readonly, strong, nonatomic) NSString *title;
@property (readonly, strong, nonatomic) NSArray<NSString *> *images;

- (ZHNewsContentViewModel *)getNewsContentViewModel;

@end
