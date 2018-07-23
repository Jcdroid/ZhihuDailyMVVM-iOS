//
//  ZHLastestNewsViewModel.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHLastestNewsViewModel.h"
#import "ZHNewsContentViewModel.h"

// Model
#import "ZHLatestNews.h"

@interface ZHLastestNewsViewModel ()

@property (readwrite, strong, nonatomic) NSNumber *id;
@property (readwrite, strong, nonatomic) NSString *title;
@property (readwrite, strong, nonatomic) NSArray<NSString *> *images;

@end

@implementation ZHLastestNewsViewModel

- (instancetype)initWithModel:(ZHLatestNewsStories *)model {
    self = [super initWithModel:model];
    if (self) {
        self.id = model.id;
        self.title = model.title;
        self.images = model.images;
    }
    return self;
}

- (ZHNewsContentViewModel *)getNewsContentViewModel {
    return [[ZHNewsContentViewModel alloc] initWithModel:self.model];
}

@end
