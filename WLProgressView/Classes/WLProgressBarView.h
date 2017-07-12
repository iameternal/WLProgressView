//
//  WLProgressBarView.h
//  ParentGet
//  
//  Created by iameternal on 2017/6/29.
//  Copyright © 2017年 iameternal. All rights reserved.
//  https://github.com/iameternal/WLProgressView.git

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
 边角弧度
 */
@property (assign, nonatomic) CGFloat cornerRadius;

/**
 进度 0.0~1.0
 */
@property (nonatomic) float progress;


/**
 显示进度条

 @param interval 播放的频率
 @param copies 切割的份数
 @param animated 是否有动画
 */
- (void)displayWithInterval:(float)interval numberOfCopies:(NSInteger)copies animated:(BOOL)animated;

@end
