//
//  ZHNewsContentViewModel.h
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import <ReactiveViewModel/ReactiveViewModel.h>

@interface ZHNewsContentViewModel : RVMViewModel

@property (readonly, strong, nonatomic) NSNumber *id;
@property (readonly, strong, nonatomic) NSString *title;
@property (readonly, strong, nonatomic) NSString *body;
@property (readonly, strong, nonatomic) NSString *css;
@property (readonly, strong, nonatomic) NSString *js;
@property (readonly, strong, nonatomic) NSString *imageSource;
@property (readonly, strong, nonatomic) NSString *shareUrl;
@property (readonly, strong, nonatomic) NSString *image;

@end
