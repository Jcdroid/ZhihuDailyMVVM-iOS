//
//  ZHLatestNews.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHLatestNews.h"

@implementation ZHLatestNews

+ (JSONKeyMapper *)keyMapper {
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}

@end

@implementation ZHLatestNewsStories

+ (JSONKeyMapper *)keyMapper {
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}

@end

@implementation ZHLatestNewsTopStories

+ (JSONKeyMapper *)keyMapper {
    //return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"ga_prefix":@"gaPrefix"
                                                       }];
}

@end