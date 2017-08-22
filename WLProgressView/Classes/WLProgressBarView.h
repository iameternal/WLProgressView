//
//  WLProgressBarView.h
//  ParentGet
//  
//  Created by iameternal on 2017/6/29.
//  Copyright © 2017年 iameternal. All rights reserved.
//  https://github.com/iameternal/WLProgressView.git
//  pod 'WLProgressView'

#import <UIKit/UIKit.h>

@interface WLProgressBarView : UIView

/**
 进度视图
 */
@property (strong, nonatomic) UIView *progressTintView;

/**
 轨迹视图
 */
@property (strong, nonatomic) UIView *trackTintView;

/**
 标题标签
 */
@property (strong, nonatomic) UILabel *titLabel;

/**
 边角弧度
 */
@property (assign, nonatomic) CGFloat cornerRadius;

/**
 进度 0.0~1.0
 */
@property (nonatomic) float progress;

/**
 标题
 */
@property (copy, nonatomic) NSString *title;

/**
 定时器
 */
@property (strong, nonatomic) NSTimer *aTimer;

/**
 显示进度条，!cell复用时，播放动画，会有视图重叠的问题，这时需要根据当前cell是否在屏幕内，控制timer的开启和关闭

 @param interval 播放的频率
 @param copies 切割的份数
 @param aProgress 进度
 @param animated 是否有动画
 */
- (void)displayWithInterval:(float)interval numberOfCopies:(NSInteger)copies progress:(float)aProgress animated:(BOOL)animated;

@end
