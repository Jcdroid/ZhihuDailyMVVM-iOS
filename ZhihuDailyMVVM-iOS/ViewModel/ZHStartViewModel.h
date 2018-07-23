//
//  ZHStartViewModel.h
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import <ReactiveViewModel/ReactiveViewModel.h>

@interface ZHStartViewModel : RVMViewModel

@property (readonly, nonatomic) NSString *text;
@property (readonly, nonatomic) NSURL *imgURL;
//@property (readonly, nonatomic) UIImage *image;


@end
