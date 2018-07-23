//
//  ZHMasterViewModel.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHMasterViewModel.h"
#import "ZHLastestNewsViewModel.h"

// Model
#import "ZHLatestNews.h"

// Data
#import "ZHNetDataFetcher.h"

@implementation ZHMasterViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        RAC(self, viewModels) = [self fetchLastestNewsStoriesViewModel];
    }
    return self;
}

- (RACSignal *)fetchLastestNewsStoriesViewModel {
    return [[self fetchLastestNews] map:^id(ZHLatestNews *lastestNews) {
        return [[lastestNews.stories.rac_sequence map:^id(NSDictionary *dictionary) {
            ZHLatestNewsStories *lastestNewsStories = [[ZHLatestNewsStories alloc] initWithDictionary:dictionary error:nil];
            ZHLastestNewsViewModel *viewModel = [[ZHLastestNewsViewModel alloc] initWithModel:lastestNewsStories];
            return viewModel;
        }] array];
    }];
}

- (RACSignal *)fetchLastestNewsStories {
    return [[self fetchLastestNews] map:^id(ZHLatestNews *lastestNews) {
        return lastestNews.stories;
    }];
}

- (RACSignal *)fetchLastestNewsTopStories {
    return [[self fetchLastestNews] map:^id(ZHLatestNews *lastestNews) {
        return lastestNews.topStories;
    }];
}

- (RACSignal *)fetchLastestNews {
    return [ZHNetDataFetcher fetchLastestNews];
}

@end
