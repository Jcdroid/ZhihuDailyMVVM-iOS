//
//  ZHNewsContent.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHNewsContent.h"

@implementation ZHNewsContent

+ (JSONKeyMapper *)keyMapper {
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}

@end
