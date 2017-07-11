//
//  EXLProgressBarView.m
//  ParentGet
//
//  Created by liuyabo on 2017/6/29.
//  Copyright © 2017年 Jack. All rights reserved.
//

#import "EXLProgressBarView.h"

@implementation EXLProgressBarView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.progressTintView];
        [self.progressTintView addSubview:self.trackTintView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.progressTintView];
        [self.progressTintView addSubview:self.trackTintView];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self.progressTintView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(0);
        make.left.mas_equalTo(weakSelf.mas_left).offset(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(0);
        make.right.mas_equalTo(weakSelf.mas_right).offset(0);
    }];
    [self.trackTintView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(0);
        make.left.mas_equalTo(weakSelf.mas_left).offset(0);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(0);
    }];
}

#pragma mark - 懒加载
- (UIView *)progressTintView {
    if (!_progressTintView) {
        _progressTintView = [UIView new];
        _progressTintView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    }
    return _progressTintView;
}
- (UIView *)trackTintView {
    if (!_trackTintView) {
        _trackTintView = [UIView new];
        _trackTintView.backgroundColor = [UIColor colorWithRed:165/255.0 green:207/255.0 blue:255/255.0 alpha:1];
    }
    return _trackTintView;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    _progressTintView.layer.masksToBounds = YES;
    _trackTintView.layer.masksToBounds = YES;
    _progressTintView.layer.cornerRadius = cornerRadius;
    _trackTintView.layer.cornerRadius = cornerRadius;
}
- (void)setProgress:(float)progress {
    _progress = progress;
    CGRect frame = self.trackTintView.frame;
    frame.size.width = self.progressTintView.frame.size.width * progress;
    self.trackTintView.frame = frame;
}
- (void)displayWithInterval:(float)interval numberOfCopies:(NSInteger)copies animated:(BOOL)animated {
    if (animated) {
        __weak typeof(self) weakSelf = self;
        __block NSInteger count = 0;
        [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
            ++ count;
            if (weakSelf.progress == 0) {
                [timer invalidate];
                CGRect frame = weakSelf.trackTintView.frame;
                frame.size.width = 0;
                weakSelf.trackTintView.frame = frame;
            } else {
                if ((float)count/copies >= weakSelf.progress) {
                    [timer invalidate];
                    CGRect frame = weakSelf.trackTintView.frame;
                    frame.size.width = weakSelf.progressTintView.frame.size.width * weakSelf.progress;
                    weakSelf.trackTintView.frame = frame;
                } else {
                    CGRect frame = weakSelf.trackTintView.frame;
                    frame.size.width = weakSelf.progressTintView.frame.size.width * ((float)count/copies);
                    weakSelf.trackTintView.frame = frame;
                }
            }
        }];
    } else {
        if (self.progress == 0) {
            CGRect frame = self.trackTintView.frame;
            frame.size.width = 0;
            self.trackTintView.frame = frame;
        } else {
            CGRect frame = self.trackTintView.frame;
            frame.size.width = self.progressTintView.frame.size.width * self.progress;
            self.trackTintView.frame = frame;
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
