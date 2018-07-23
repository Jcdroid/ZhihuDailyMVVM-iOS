//
//  ZHMasterViewController.m
//  ZhihuDailyMVVM-iOS
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import "ZHMasterViewController.h"
#import "ZHNewsContentViewController.h"
#import "ZHReactiveCocoaTestViewController.h"

// Util
#import "CETableViewBindingHelper.h"

// View Model
#import "ZHMasterViewModel.h"
#import "ZHLastestNewsViewModel.h"
#import "ZHNewsContentViewModel.h"

@interface ZHMasterViewController ()

@property (strong, nonatomic) ZHMasterViewModel *viewModel;

@end

@implementation ZHMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @"ReactiveCocoa";
    @weakify(self);
    barButtonItem.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        ZHReactiveCocoaTestViewController *vc = [[ZHReactiveCocoaTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return [RACSignal empty];
    }];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    [self bindViewModel];
}

- (void)bindViewModel {
    @weakify(self);
    RACCommand *selectionCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        ZHLastestNewsViewModel *lastestNewsViewModel = input;
        ZHNewsContentViewModel *viewModel = [lastestNewsViewModel getNewsContentViewModel];
        ZHNewsContentViewController *vc = [[ZHNewsContentViewController alloc] initWithViewModel:viewModel];
        [self.navigationController pushViewController:vc animated:YES];
        return [RACSignal empty];
    }];
    UINib *nib = [UINib nibWithNibName:@"ZHMasterTableViewCell" bundle:nil];
    
    [CETableViewBindingHelper bindingHelperForTableView:self.tableView sourceSignal:RACObserve(self.viewModel, viewModels) selectionCommand:selectionCommand templateCell:nib];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getters & setters

- (ZHMasterViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ZHMasterViewModel alloc] init];
    }
    return _viewModel;
}

@end
