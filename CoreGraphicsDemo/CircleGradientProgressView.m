//
//  CircleGradientProgressView.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-8-8.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "CircleGradientProgressView.h"

#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式

#define rgbColor(r, g, b) ([UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1])

#define PROGRESS_LINE_WIDTH 4 //弧线的宽度

@interface CircleGradientProgressView ()
{
    CAShapeLayer *_trackLayer;
    CAShapeLayer *_progressLayer;
}
@end

@implementation CircleGradientProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        float size = frame.size.width > frame.size.height ? frame.size.height : frame.size.width;
        
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, size, size);
        _trackLayer = [CAShapeLayer layer];
        _trackLayer.frame = self.bounds;
        [self.layer addSublayer:_trackLayer];
        _trackLayer.fillColor = [UIColor clearColor].CGColor;
        _trackLayer.strokeColor = [[UIColor greenColor] CGColor];
        _trackLayer.opacity = 0.75;
        _trackLayer.lineWidth = PROGRESS_LINE_WIDTH;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size / 2, size / 2)
                                                            radius:(size - PROGRESS_LINE_WIDTH) / 2.0
                                                        startAngle:degreesToRadians(-90)
                                                          endAngle:degreesToRadians(270)
                                                         clockwise:YES];
        _trackLayer.path = [path CGPath];
        
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.frame = self.bounds;
        _progressLayer.fillColor = [UIColor clearColor].CGColor;
        _progressLayer.strokeColor = [UIColor brownColor].CGColor;
        _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
        _progressLayer.path = [path CGPath];
        _progressLayer.strokeEnd = 0;
        
        CALayer *graLayer = [CALayer layer];
        
        CAGradientLayer *rightGradientLayer = [CAGradientLayer layer];
        rightGradientLayer.frame = CGRectMake(self.bounds.size.width / 2, 0, self.bounds.size.width / 2, self.bounds.size.height);
        [rightGradientLayer setColors:[NSArray arrayWithObjects:(id)[rgbColor(236, 186, 63) CGColor],(id)[rgbColor(195, 69, 29) CGColor], nil]];
        [graLayer addSublayer:rightGradientLayer];
        
        CAGradientLayer *leftGradientLayer = [CAGradientLayer layer];
        leftGradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width / 2, self.bounds.size.height);
        [leftGradientLayer setColors:[NSArray arrayWithObjects:(id)[rgbColor(136, 7, 39) CGColor],(id)[rgbColor(195, 69, 29) CGColor], nil]];
        [graLayer addSublayer:leftGradientLayer];
        
        [graLayer setMask:_progressLayer];
        [self.layer addSublayer:graLayer];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [CATransaction begin];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:
     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:0.3];
    _progressLayer.strokeEnd = progress;
    _progress = progress;
    [CATransaction commit];
}

- (void)setProgress:(CGFloat)progress
{
    [self setProgress:progress animated:NO];
}

@end
