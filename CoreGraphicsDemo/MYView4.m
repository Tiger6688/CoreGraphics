//
//  MYView4.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-17.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "MYView4.h"

@interface MYView4 ()
@property(nonatomic) CGGradientRef gradient;
@end

@implementation MYView4

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //设置可绘图区域
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect clip = CGRectInset(CGContextGetClipBoundingBox(context), 20, 20);
    CGContextClipToRect(context, clip);
    
    BOOL flag = YES;
    if (flag) {
        //绘制矩形的渐变
        float edgeWidth = 40;
        CGPoint startPoint = CGPointMake(edgeWidth, self.bounds.size.height - edgeWidth);
        CGPoint endPoint = CGPointMake(self.bounds.size.width - edgeWidth, edgeWidth);
        
        CGContextDrawLinearGradient(context, self.gradient, startPoint, endPoint, kCGGradientDrawsAfterEndLocation);
    }else{
        //绘制圆形的渐变
        CGPoint center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
        CGContextDrawRadialGradient(context, self.gradient, center, 20, center, 40, 0);
    }
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextStrokeRectWithWidth(context, clip, 2);
    
}

- (CGGradientRef)gradient
{
    if (!_gradient) {
        CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
        CGFloat colors[] =
        {
            1, 0, 0, 1,
            0, 1, 0, 1,
            0, 0, 1, 1,
        };
        _gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, 3);
        CGColorSpaceRelease(rgb);
    }
    return _gradient;
}


@end
