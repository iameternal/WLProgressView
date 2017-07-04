//
//  ViewController.m
//  WLProgressView
//
//  Created by liuyabo on 2017/7/3.
//  Copyright © 2017年 Exinlei. All rights reserved.
//

#import "ViewController.h"
#import "EXLProgressBarView.h"

@interface ViewController ()
@property (strong, nonatomic) EXLProgressBarView *progressView;

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
    [self.progressView displayWithInterval:0.01 numberOfCopies:1000 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (EXLProgressBarView *)progressView {
    if (!_progressView) {
        _progressView = [[EXLProgressBarView alloc] init];
    }
    return _progressView;
}
@end
