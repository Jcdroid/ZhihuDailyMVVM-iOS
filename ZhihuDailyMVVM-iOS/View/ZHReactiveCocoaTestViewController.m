//
//  ZHReactiveCocoaTestViewController.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHReactiveCocoaTestViewController.h"

@interface ZHReactiveCocoaTestViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UIButton *button;

@property (strong, nonatomic) NSString *username;

@end

@implementation ZHReactiveCocoaTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.button];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(68);
        make.right.equalTo(self.view).offset(-8);
        make.height.mas_equalTo(40);
    }];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(8);
        make.right.equalTo(self.view).offset(-8);
        make.top.equalTo(self.textField.mas_bottom).offset(20);
        make.height.equalTo(self.textField);
    }];
    
    // Delegate
    [[self rac_signalForSelector:@selector(textFieldDidBeginEditing:) fromProtocol:@protocol(UITextFieldDelegate)] subscribeNext:^(id x) {
        NSLog(@"Delegate = %@", x);
    }];
    
    // target-action
    [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *button) {
        NSLog(@"button被点击");
    }];
    
    // Notification
    RAC(self, username) = [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidChangeNotification object:nil] map:^id(NSNotification *notification) {
        NSLog(@"Notification = %@", notification);
        return ((UITextField *)notification.object).text;
    }];
    
    // KVO
    [RACObserve(self, username) subscribeNext:^(NSString *username) {
        NSLog(@"KVO = %@", username);
    }];
    
    NSArray *strings = @[@"hello", @"world", @"a", @"ni", @"hao", @"ma", @"zai", @"gan", @"sha"];
    
    RACSequence *results = [[strings.rac_sequence filter:^BOOL(NSString *str) {
        return str.length >= 3;
    }] map:^id(NSString *str) {
        return str;
    }];
    NSLog(@"%@", results.head);
    NSLog(@"%@", results.tail);
    NSLog(@"%@", results.array);
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        _textField.delegate = self;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _textField;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitle:@"Button" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button;
}

@end
