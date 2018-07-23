//
//  ZHNetDataFetcher.h
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHNetDataFetcher : NSObject

+ (RACSignal *)fetchStartImage;
+ (RACSignal *)fetchLastestNews;
+ (RACSignal *)fetchNewsContent:(NSNumber *)Id;
+ (RACSignal *)fetchCSSContent:(NSURL *)url;

@end
