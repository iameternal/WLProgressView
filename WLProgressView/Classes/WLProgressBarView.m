//
//  WLProgressBarView.m
//  ParentGet
//
//  Created by iameternal on 2017/6/29.
//  Copyright © 2017年 iameternal. All rights reserved.
//

#import "WLProgressBarView.h"
#import "Masonry.h"

@implementation WLProgressBarView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.progressTintView];
        [self.progressTintView addSubview:self.trackTintView];
        [self.progressTintView addSubview:self.titLabel];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.progressTintView];
        [self.progressTintView addSubview:self.trackTintView];
        [self.progressTintView addSubview:self.titLabel];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.progressTintView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
    [self.trackTintView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
    }];
    [self.titLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
}

#pragma mark - UI
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
- (UILabel *)titLabel {
    if (!_titLabel) {
        _titLabel = [[UILabel alloc] init];
        _titLabel.textAlignment = NSTextAlignmentCenter;
        _titLabel.font = [UIFont systemFontOfSize:15.0];
        _titLabel.textColor = [UIColor colorWithRed:88/255.0 green:88/255.0 blue:88/255.0 alpha:1.0];
    }
    return _titLabel;
}
#pragma mark - Attributes
- (void)setCornerRadius:(CGFloat)cornerRadius {
    dispatch_async(dispatch_get_main_queue(), ^{
        _cornerRadius = cornerRadius;
        _progressTintView.layer.masksToBounds = YES;
        _trackTintView.layer.masksToBounds = YES;
        _progressTintView.layer.cornerRadius = cornerRadius;
        _trackTintView.layer.cornerRadius = cornerRadius;
    });
}
- (void)setProgress:(float)progress {
    dispatch_async(dispatch_get_main_queue(), ^{
        _progress = progress;
        CGRect frame = self.trackTintView.frame;
        frame.size.width = self.progressTintView.frame.size.width * progress;
        self.trackTintView.frame = frame;
    });
}
- (void)setTitle:(NSString *)title {
    _title = title;
    if(title == nil || title.length == 0 || title == NULL) {
        title = @"";
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        self.titLabel.text = title;
    });
}
- (void)displayWithInterval:(float)interval numberOfCopies:(NSInteger)copies progress:(float)aProgress animated:(BOOL)animated {
    if (animated) {
        __block NSInteger count = 0;
        self.aTimer = [NSTimer scheduledTimerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
            ++ count;
            if (aProgress == 0) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [timer invalidate];
                    CGRect frame = self.trackTintView.frame;
                    frame.size.width = 0;
                    self.trackTintView.frame = frame;
                });
            } else {
                if ((float)count/copies >= aProgress) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [timer invalidate];
                        CGRect frame = self.trackTintView.frame;
                        frame.size.width = self.progressTintView.frame.size.width * aProgress;
                        self.trackTintView.frame = frame;
                    });
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        CGRect frame = self.trackTintView.frame;
                        frame.size.width = self.progressTintView.frame.size.width * ((float)count/copies);
                        self.trackTintView.frame = frame;
                    });
                }
            }
        }];
        [[NSRunLoop currentRunLoop] addTimer:self.aTimer forMode:NSRunLoopCommonModes];
    } else {
        if (aProgress == 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                CGRect frame = self.trackTintView.frame;
                frame.size.width = 0;
                self.trackTintView.frame = frame;
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                CGRect frame = self.trackTintView.frame;
                frame.size.width = self.progressTintView.frame.size.width * aProgress;
                self.trackTintView.frame = frame;
            });
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
