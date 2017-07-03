//
//  EXLProgressBarView.m
//  ParentGet
//
//  Created by liuyabo on 2017/6/29.
//  Copyright © 2017年 Jack. All rights reserved.
//

#import "EXLProgressBarView.h"

@implementation EXLProgressBarView
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
        _progressTintView.backgroundColor = EXLColor(240, 240, 240);
    }
    return _progressTintView;
}
- (UIView *)trackTintView {
    if (!_trackTintView) {
        _trackTintView = [UIView new];
        _trackTintView.backgroundColor = EXLColor(165, 207, 255);
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
    self.trackTintView.width = self.progressTintView.width * progress;
}
- (void)displayWithInterval:(float)interval numberOfCopies:(NSInteger)copies animated:(BOOL)animated {
    if (animated) {
        __weak typeof(self) weakSelf = self;
        __block NSInteger count = 0;
        [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
            ++ count;
            if (weakSelf.progress == 0) {
                [timer invalidate];
                weakSelf.trackTintView.width = 0;
            } else {
                if ((float)count/copies >= weakSelf.progress) {
                    [timer invalidate];
                    weakSelf.trackTintView.width = weakSelf.progressTintView.width * weakSelf.progress;
                } else {
                    weakSelf.trackTintView.width = weakSelf.progressTintView.width * ((float)count/copies);
                }
            }
        }];
    } else {
        if (self.progress == 0) {
            self.trackTintView.width = 0;
        } else {
            self.trackTintView.width = self.progressTintView.width * self.progress;
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
