//
//  MYView5.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-18.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "MYView5.h"

@implementation MYView5

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, 128, 300);
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //以下3行是为了校正坐标系，不然画出来的图像是上下颠倒的
    CGFloat height = self.bounds.size.height;
	CGContextTranslateCTM(context, 0.0, height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    
    [self addStarToContext:context at:CGPointMake(64, 64) radius:45 angle:0];
    CGContextSaveGState(context);
    CGContextClip(context);
    CGContextFillRect(context, CGRectMake(19, 19, 90, 90));
    CGContextDrawImage(context, CGRectMake(14, 14, 100, 100), [UIImage imageNamed:@"google"].CGImage);
    CGContextRestoreGState(context);
    
    [self addStarToContext:context at:CGPointMake(64, 64 + 84) radius:45 angle:0];
    CGContextSaveGState(context);
    CGContextEOClip(context);
    CGContextFillRect(context, CGRectMake(19, 19 + 84, 90, 90));
    CGContextDrawImage(context, CGRectMake(14, 14 + 84, 100, 100), [UIImage imageNamed:@"google"].CGImage);
    CGContextRestoreGState(context);
    
    [self addStarToContext:context at:CGPointMake(64, 64 + 87 * 2) radius:45 angle:0];
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextAddRect(context, CGRectMake(9, 9 + 87 * 2, 110, 110));
    CGContextSaveGState(context);
    CGContextEOClip(context);
    CGContextFillRect(context, CGRectMake(19, 19 + 87 * 2, 90, 90));
    CGContextDrawImage(context, CGRectMake(14, 14 + 87 * 2, 100, 100), [UIImage imageNamed:@"google"].CGImage);
    CGContextRestoreGState(context);
}

- (void)addStarToContext:(CGContextRef)context at:(CGPoint)center radius:(CGFloat)radius angle:(CGFloat)angle
{
	CGFloat x = radius * sinf(angle * M_PI / 5.0) + center.x;
	CGFloat y = radius * cosf(angle * M_PI / 5.0) + center.y;
	CGContextMoveToPoint(context, x, y);
	for(int i = 1; i < 5; ++i)
	{
		CGFloat x = radius * sinf((i * 4.0 * M_PI + angle) / 5.0) + center.x;
		CGFloat y = radius * cosf((i * 4.0 * M_PI + angle) / 5.0) + center.y;
		CGContextAddLineToPoint(context, x, y);
	}
	// And close the subpath.
	CGContextClosePath(context);
}


@end
