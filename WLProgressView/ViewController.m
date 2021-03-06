//
//  ViewController.m
//  WLProgressView
//
//  Created by iameternal on 2017/7/3.
//  Copyright © 2017年 iameternal. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "WLProgressBarView.h"

@interface ViewController ()
@property (strong, nonatomic) WLProgressBarView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.progressView];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY).offset(0);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(20);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-20);
        make.height.mas_equalTo(20);
    }];
    self.progressView.progress = 0.9;
    self.progressView.cornerRadius = 12.0;
    self.progressView.title = @"标题";
    [self.progressView displayWithInterval:0.01 numberOfCopies:1000 progress:0.9 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (WLProgressBarView *)progressView {
    if (!_progressView) {
        _progressView = [[WLProgressBarView alloc] init];
    }
    return _progressView;
}
@end
