//
//  ZHNewsContentViewModel.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHNewsContentViewModel.h"

// Model
#import "ZHNewsContent.h"
#import "ZHLatestNews.h"

// Data
#import "ZHNetDataFetcher.h"

@interface ZHNewsContentViewModel ()

@property (readwrite, strong, nonatomic) ZHNewsContent *newsContent;

@property (readwrite, strong, nonatomic) NSString *title;

@end

@implementation ZHNewsContentViewModel

- (instancetype)initWithModel:(ZHLatestNewsStories *)model {
    self = [super initWithModel:model];
    if (self) {
        self.title = model.title;
        RAC(self, newsContent) = [self fetchNewsContent:model.id];
        RAC(self, body) = RACObserve(self, newsContent.body);
//        RAC(self, css) = [RACObserve(self, newsContent.css) map:^id(NSArray *css) {
//            return css[0];
//        }];
        [RACObserve(self, newsContent.css) subscribeNext:^(NSArray *css) {
            RAC(self, css) = [self fetchCSSContent:nil];
        }];
    }
    return self;
}

- (RACSignal *)fetchNewsContent:(NSNumber *)Id {
    return [ZHNetDataFetcher fetchNewsContent:Id];
}

- (RACSignal *)fetchCSSContent:(NSURL *)url {
    return [ZHNetDataFetcher fetchCSSContent:url];
}

@end
