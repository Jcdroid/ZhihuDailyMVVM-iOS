//
//  ZHNewsContentViewController.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/14.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHNewsContentViewController.h"

// View Model
#import "ZHNewsContentViewModel.h"

@interface ZHNewsContentViewController () <UIWebViewDelegate>

@property (strong, nonatomic) ZHNewsContentViewModel *viewModel;

@property (strong, nonatomic) UIWebView *webView;

@property (strong, nonatomic) NSString *css;

@end

@implementation ZHNewsContentViewController

- (instancetype)initWithViewModel:(id)viewModel
{
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        self.title = self.viewModel.title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    @weakify(self);
    RAC(self, css) = RACObserve(self, viewModel.css);
    
//    [RACObserve(self, viewModel.css) subscribeNext:^(id css) {
//        NSLog(@"%@", css);
//        
//        /*
//        NSString *js = [NSString stringWithFormat:
//                        @"var styleNode = document.createElement('style');\n"
//                        "styleNode.type = \"text/css\";\n"
//                        "var styleText = document.createTextNode('%@');\n"
//                        "styleNode.appendChild(styleText);\n"
//                        "document.getElementsByTagName('head')[0].appendChild(styleNode);\n", css];
//         */
//        
//        NSString *js = [NSString stringWithFormat:@"var cssChild = document.createElement('link');"
//                        "cssChild = 'text/css';"
//                        "cssChild = 'stylesheet';"
//                        "cssChild = '%@';", css];
//        js = [NSString stringWithFormat:@"%@ document.getElementsByTagName('head')[0].appendChild(cssChild);", js];
//        [self.webView stringByEvaluatingJavaScriptFromString:js];
//    }];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [RACObserve(self, viewModel.body) subscribeNext:^(id body) {
        @strongify(self);
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [hud hide:YES];
        [self.webView loadHTMLString:body baseURL:NULL];
    }];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%@", self.css);
    
     NSString *js = [NSString stringWithFormat:
     @"var styleNode = document.createElement('style');\n"
     "styleNode.type = \"text/css\";\n"
     "var styleText = document.createTextNode('%@');\n"
     "styleNode.appendChild(styleText);\n"
     "document.getElementsByTagName('head')[0].appendChild(styleNode);\n", self.css];
    
//    NSString *js = [NSString stringWithFormat:@"var cssChild = document.createElement('link');"
//                    "cssChild = 'text/css';"
//                    "cssChild = 'stylesheet';"
//                    "cssChild = '%@';", self.css];
//    js = [NSString stringWithFormat:@"%@ document.getElementsByTagName('head')[0].appendChild(cssChild);", js];
    [webView stringByEvaluatingJavaScriptFromString:js];
}

#pragma mark - getters

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
    }
    return _webView;
}

@end
