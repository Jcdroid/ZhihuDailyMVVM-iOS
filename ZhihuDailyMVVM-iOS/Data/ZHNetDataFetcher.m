//
//  ZHNetDataFetcher.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHNetDataFetcher.h"

// Model
#import "ZHStartModel.h"
#import "ZHLatestNews.h"
#import "ZHNewsContent.h"

@implementation ZHNetDataFetcher

+ (RACSignal *)fetchStartImage {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:ZHIHU_START_IMAGE]];
    return [[[[[[NSURLConnection rac_sendAsynchronousRequest:request] reduceEach:^id(NSURLResponse *response, NSData *data){
        return data;
    }] deliverOn:[RACScheduler mainThreadScheduler]] map:^id(id data) {
        id results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        ZHStartModel *startModel = [[ZHStartModel alloc] initWithDictionary:results error:nil];

        return startModel;
    }] publish] autoconnect];
}

+ (RACSignal *)fetchLastestNews {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:ZHIHU_LASTEST_NEWS]];
    return [[[[[[NSURLConnection rac_sendAsynchronousRequest:request] reduceEach:^id(NSURLResponse *response, NSData *data){
        return data;
    }] deliverOn:[RACScheduler mainThreadScheduler]] map:^id(id data) {
        id results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        ZHLatestNews *lastestNews = [[ZHLatestNews alloc] initWithDictionary:results error:nil];
        
        return lastestNews;
    }] publish] autoconnect];
}

+ (RACSignal *)fetchNewsContent:(NSString *)Id {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:ZHIHU_NEWS_CONTENT(Id)]];
    return [[[[[[NSURLConnection rac_sendAsynchronousRequest:request] reduceEach:^id(NSURLResponse *response, NSData *data){
        return data;
    }] deliverOn:[RACScheduler mainThreadScheduler]] map:^id(id data) {
        id results = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        ZHNewsContent *newsContent = [[ZHNewsContent alloc] initWithDictionary:results error:nil];
        
        return newsContent;
    }] publish] autoconnect];
}

+ (RACSignal *)fetchCSSContent:(NSURL *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://news-at.zhihu.com/css/news_qa.auto.css?v=77778"]];
    return [[[[[[NSURLConnection rac_sendAsynchronousRequest:request] reduceEach:^id(NSURLResponse *response, NSData *data){
        return data;
    }] deliverOn:[RACScheduler mainThreadScheduler]] map:^id(id data) {
        //id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSString *css = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        return css;
    }] publish] autoconnect];
}

#pragma mark - Private

/*
+ (void)configureStartModel:(ZHStartModel *)startModel withDictionary:(NSDictionary *)dictionary {
    startModel.text = dictionary[@"text"];
    startModel.img = dictionary[@"img"];
}

+ (void)downloadStartImageForStartModel:(ZHStartModel *)startModel {
    RAC(startModel, imgData) = [self download:startModel.imgURL];
}

+ (RACSignal *)download:(NSString *)urlString {
    NSAssert(urlString, @"urlString must be nil");

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];

    return [[[NSURLConnection rac_sendAsynchronousRequest:request] reduceEach:^id(NSURLResponse *response, NSData *data){
        return data;
    }] deliverOn:[RACScheduler mainThreadScheduler]];
}
 */

@end
