//
//  AnimationDrawView.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-30.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "AnimationDrawView.h"

@interface AnimationDrawView ()
{
    NSUInteger progress;
    CGFloat perimeter;
    BOOL showHighlight;
}

@end

@implementation AnimationDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        perimeter = (frame.size.width + frame.size.height) * 2;
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 / 60.0 target:self selector:@selector(animationDraw) userInfo:nil repeats:YES];
        [timer fire];

    }
    return self;
}

- (void)animationDraw
{
    progress++;
    
    if (progress > perimeter) {
        progress = 0;
        showHighlight = !showHighlight;
    }
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextFillRect(ctx, rect);
    
    CGContextSetLineWidth(ctx, 6);
    

    [self addPreviousLine:ctx];
    if (showHighlight) {
        [self addNextLine:ctx];
    }
                                        
}

- (void)addPreviousLine:(CGContextRef)ctx
{
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    CGContextMoveToPoint(ctx, 0, 0);
    if (progress < width) {
        CGContextAddLineToPoint(ctx, progress, 0);
    }else{
        CGContextAddLineToPoint(ctx, width, 0);
        if (progress < width + height) {
            CGContextAddLineToPoint(ctx, width, progress - width);
        }else{
            CGContextAddLineToPoint(ctx, width, height);
            if (progress < width + height + width) {
                CGContextAddLineToPoint(ctx, (width - (progress - (width + height))), height);
            }else{
                CGContextAddLineToPoint(ctx, 0, height);
                CGContextAddLineToPoint(ctx, 0, height - (progress - (width + height + width)));
            }
        }
    }
    if (showHighlight) {
        CGContextSetStrokeColorWithColor(ctx, [UIColor grayColor].CGColor);
    }else{
        CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    }
    CGContextStrokePath(ctx);
}

- (void)addNextLine:(CGContextRef)ctx
{
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    CGContextMoveToPoint(ctx, 0, 0);
    
    if (progress > (width + height + width)) {
        CGContextAddLineToPoint(ctx, 0, height - (progress - (width + height + width)));
    }else{
        CGContextAddLineToPoint(ctx, 0, height);
        if (progress > (height + width)) {
            CGContextAddLineToPoint(ctx, width - (progress - (height + width)), height);
        }else{
            CGContextAddLineToPoint(ctx, width, height);
            if (progress > width) {
                CGContextAddLineToPoint(ctx, width, (progress - width));
            }else{
                CGContextAddLineToPoint(ctx, width, 0);
                CGContextAddLineToPoint(ctx, progress, 0);
            }
        }
    }
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextStrokePath(ctx);
}


@end
