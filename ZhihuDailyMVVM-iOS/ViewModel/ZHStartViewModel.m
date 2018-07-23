//
//  ZHStartViewModel.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHStartViewModel.h"

// Model
#import "ZHStartModel.h"

// Data
#import "ZHNetDataFetcher.h"

@interface ZHStartViewModel ()

@property (readonly, nonatomic) ZHStartModel *startModel;

@end

@implementation ZHStartViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        RAC(self, startModel) = [self fetchStartImage];
        RAC(self, text) = RACObserve(self, startModel.text);
        RAC(self, imgURL) = RACObserve(self, startModel.img);
        
        /*
        RAC(self, image) = [[RACObserve(self, startModel.imgData) map:^id(NSData *imgData) {
            
            return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [imgData af_decompressedImageFromJPEGDataWithCallback:^(UIImage *decompressedImage) {
                    [subscriber sendNext:decompressedImage];
                    [subscriber sendCompleted];
                }];
                return nil;
            }] deliverOn:[RACScheduler scheduler]];
            
        }] switchToLatest];
         */
    }
    return self;
}

- (RACSignal *)fetchStartImage {
    return [[[ZHNetDataFetcher fetchStartImage] logError] catchTo:[RACSignal empty]];
}

@end
