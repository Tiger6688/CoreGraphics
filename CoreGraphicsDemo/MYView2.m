//
//  MYView2.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-15.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "MYView2.h"

@implementation MYView2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, 150, 150);
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    /*
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 100, 19);
    CGContextSetLineWidth(context, 20);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(context, 80, 25);
    CGContextAddLineToPoint(context, 100, 0);
    CGContextAddLineToPoint(context, 120, 25);
    CGContextFillPath(context);
    
    CGContextMoveToPoint(context, 90, 101);
    CGContextAddLineToPoint(context, 100, 90);
    CGContextAddLineToPoint(context, 110, 101);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGContextFillPath(context);
     */
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    //在上下文裁剪区域中挖一个三角形的孔
    CGContextMoveToPoint(context, 90, 100);
    CGContextAddLineToPoint(context, 100, 90);
    CGContextAddLineToPoint(context, 110, 100);
    CGContextClosePath(context);
    CGContextAddRect(context, CGContextGetClipBoundingBox(context));
    //使用奇偶规则，裁剪区域为矩形减去三角形区域
    CGContextEOClip(context);
    
    //绘制垂线
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 100, 19);
    CGContextSetLineWidth(context, 20);
    //使用路径的描边版本替换图形上下文的路径
    CGContextReplacePathWithStrokedPath(context);
    //对路径的描边版本实施裁剪
    CGContextClip(context);
    //绘制渐变
    CGFloat locs[3] = {0.0, 0.5, 1.0};
    CGFloat colors[12] = {
        1, 0, 0, 0.4,//开始颜色 红
        0, 0, 0, 1,//中间颜色 黑
        0, 1, 0, 0.6//末尾颜色，绿
    };
    CGColorSpaceRef sp = CGColorSpaceCreateDeviceRGB();
    CGGradientRef grad = CGGradientCreateWithColorComponents(sp, colors, locs, 3);
    CGContextDrawLinearGradient(context, grad, CGPointMake(89, 0), CGPointMake(111, 0), 0);
    CGColorSpaceRelease(sp);
    CGGradientRelease(grad);
    CGContextRestoreGState(context);
    
    //画红色箭头
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
//    CGColorSpaceRef colorRef = CGColorSpaceCreatePattern(NULL);
//    CGContextSetFillColorSpace(context, colorRef);
//    CGColorSpaceRelease(colorRef);
//    CGPatternCallbacks callback = {0, &drawStripes, Null};
    
    CGContextMoveToPoint(context, 80, 25);
    CGContextAddLineToPoint(context, 100, 0);
    CGContextAddLineToPoint(context, 120, 25);
    CGContextFillPath(context);
    
    
    /*
    UIBezierPath *p = [UIBezierPath bezierPath];
    
    [[UIColor blueColor] setStroke];
    [p moveToPoint:CGPointMake(100, 100)];
    [p addLineToPoint:CGPointMake(100, 19)];
    [p setLineWidth:20];
    [p stroke];
    
    [p removeAllPoints];
    [[UIColor orangeColor] setFill];
    [p moveToPoint:CGPointMake(80, 25)];
    [p addLineToPoint:CGPointMake(100, 0)];
    [p addLineToPoint:CGPointMake(120, 25)];
    [p fill];
    
    [p removeAllPoints];
    [p moveToPoint:CGPointMake(90, 101)];
    [p addLineToPoint:CGPointMake(100, 90)];
    [p addLineToPoint:CGPointMake(110, 101)];
    [p fillWithBlendMode:kCGBlendModeClear alpha:1.0];
     */
    
    /*
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextSetLineWidth(context, 5);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(10, 10)];
    [path stroke];
     */
}


@end
