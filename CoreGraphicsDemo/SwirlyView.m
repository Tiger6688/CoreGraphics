//
//  SwirlyView.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-21.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "SwirlyView.h"

#pragma mark - Custom CALayer Delegate

@interface LayerDelegate : NSObject
{
    id _target;
}
- (id) initWithView:(id)target;
@end

@implementation LayerDelegate

- (id) initWithView:(id)target
{
    self = [super init];
    if (self) {
        _target = target;
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    [_target drawLayer:layer inContext:ctx];
}

@end

#pragma mark - SwirlyView

@interface SwirlyView ()
{
    CALayer *swirlyLayer;
    LayerDelegate *layerDelegate;
}

@end

@implementation SwirlyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _thickness = 20;
        _segmentCount = 6;
        self.backgroundColor = [UIColor clearColor];
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:
                          CGRectMake(0, (self.bounds.size.height - 40) / 2.0,
                                     self.bounds.size.width, 40)];
        label.text = @"Warning";
        label.textColor = [UIColor brownColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
        layerDelegate = [[LayerDelegate alloc]initWithView:self];
        
        swirlyLayer = [CALayer layer];
        swirlyLayer.frame = self.bounds;
        swirlyLayer.delegate  = layerDelegate;
        [swirlyLayer setNeedsDisplay];
        [self.layer addSublayer:swirlyLayer];
        [self addAnimation];
    }
    return self;
}

- (void)addAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = @0;
    animation.toValue = @(-M_PI * 2);
    animation.duration = 3;
    animation.repeatCount = HUGE_VALF;
    animation.delegate = self;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [swirlyLayer addAnimation:animation forKey:@"swirlyAnimation"];
}

- (void)setSegmentCount:(NSInteger)segmentCount
{
    _segmentCount = segmentCount;
    [self setNeedsDisplay];
}

- (void)setThickness:(CGFloat)thickness
{
    _thickness = thickness;
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextSetLineWidth(context, _thickness);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 8, [UIColor blackColor].CGColor);
    CGContextBeginPath(context);
    
    float start = 0.0;
    float step = M_PI / _segmentCount;
    float end = 0;
    
    float centerX = self.bounds.size.width / 2;
    float centerY = self.bounds.size.height / 2;
    float radius  = MIN(centerX, centerY) - _thickness;
    
    
    for (int i = 0; i < _segmentCount; ++i) {
        end = start + step;
        CGContextMoveToPoint(context,
                             centerX + cos(start) * (radius - _thickness / 2.0f),
                             centerY + sin(start) * (radius - _thickness / 2.0f));
        CGContextAddArc(context, centerX, centerY, radius - (_thickness / 2.0f), start, end, NO);
        start = end + step;
    }
    
    CGContextStrokePath(context);
}
 */

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextSetLineWidth(ctx, _thickness);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 8, [UIColor blackColor].CGColor);
    CGContextBeginPath(ctx);
    
    float start = 0.0;
    float step = M_PI / _segmentCount;
    float end = 0;
    
    float centerX = self.bounds.size.width / 2;
    float centerY = self.bounds.size.height / 2;
    float radius  = MIN(centerX, centerY) - _thickness;
    
    
    for (int i = 0; i < _segmentCount; ++i) {
        end = start + step;
        CGContextMoveToPoint(ctx,
                             centerX + cos(start) * (radius - _thickness / 2.0f),
                             centerY + sin(start) * (radius - _thickness / 2.0f));
        CGContextAddArc(ctx, centerX, centerY, radius - (_thickness / 2.0f), start, end, NO);
        start = end + step;
    }
    
    CGContextStrokePath(ctx);
}

@end
