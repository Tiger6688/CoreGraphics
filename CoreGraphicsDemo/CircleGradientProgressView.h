//
//  CircleGradientProgressView.h
//  CoreGraphicsDemo
//
//  Created by Henry on 14-8-8.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleGradientProgressView : UIView

@property(nonatomic, assign) CGFloat progress;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
