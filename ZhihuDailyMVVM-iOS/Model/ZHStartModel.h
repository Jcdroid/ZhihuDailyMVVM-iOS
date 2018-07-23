//
//  ZHStartModel.h
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHStartModel : JSONModel

@property (readwrite, strong, nonatomic) NSString *text;
@property (readwrite, strong, nonatomic) NSString *img;
//@property (readwrite, strong, nonatomic) NSData *imgData;

@end
