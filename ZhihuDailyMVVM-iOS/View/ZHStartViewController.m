//
//  ZHStartViewController.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHStartViewController.h"
#import "ZHMasterViewController.h"

// ViewModel
#import "ZHStartViewModel.h"

#import "ZHAppDelegate.h"

@interface ZHStartViewController ()

@property (nonatomic, strong) ZHStartViewModel *viewModel;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation ZHStartViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.textLabel];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(self.view);
    }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-40);
        make.height.equalTo(@21);
    }];
    
    @weakify(self);
    [RACObserve(self.viewModel, imgURL) subscribeNext:^(id x) {
        @strongify(self);
        [self.imageView sd_setImageWithURL:x completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
//            [UIView animateWithDuration:3 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//                self.imageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
//            } completion:^(BOOL finished) {
//                if (finished) {
//                    ZHAppDelegate *appDelegate = (ZHAppDelegate *)[UIApplication sharedApplication].delegate;
//                    [appDelegate initMasterViewController];
//                }
//            }];
            [UIView animateWithDuration:2 animations:^{
                self.imageView.transform = CGAffineTransformMakeScale(1.3, 1.3);
                self.imageView.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    ZHAppDelegate *appDelegate = (ZHAppDelegate *)[UIApplication sharedApplication].delegate;
                    [appDelegate initMasterViewController];
                }
            }];
        }];
    }];
    //RAC(self.imageView, image) = RACObserve(self.viewModel, image);
    RAC(self.textLabel, text) = RACObserve(self.viewModel, text);
}

#pragma mark - getter

- (ZHStartViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ZHStartViewModel alloc] init];
    }
    return _viewModel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

@end
