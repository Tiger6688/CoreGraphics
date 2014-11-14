//
//  DotMatrixView.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-8-6.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "DotMatrixView.h"
#include <sys/sysctl.h>

const static NSInteger dotSize = 4;

@interface DotMatrixView ()
{
    NSTimer *changeTimer;
    NSInteger index;
}
@property(nonatomic, strong) NSMutableArray *redDots;

@end

@implementation DotMatrixView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.redDots = [[NSMutableArray alloc]initWithObjects:
        [NSNull null],
        [NSNull null],
        @[@1, @2, @3, @7],
        @[@1, @4, @7],
        @[@1, @4, @7],
        @[@1, @2, @3, @7],
        @[@1, @7],
        @[@1, @7],
        @[@1, @7],
        @[@1, @7],
        [NSNull null],
        [NSNull null],
        nil];
        
    }
    return self;
}

- (void)changeImageByArray:(NSArray *)dots
{
    index = 0;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:dots forKey:@"array"];
    changeTimer = [NSTimer scheduledTimerWithTimeInterval:1 / 40.0 target:self selector:@selector(reDraw:) userInfo:dict repeats:YES];
}

- (void)reDraw:(NSTimer *)timer
{
    NSArray *array = [[timer userInfo] objectForKey:@"array"];
    [self.redDots removeObjectAtIndex:0];
    [self.redDots addObject:[array objectAtIndex:index]];
    index++;
    if (index == 12) {
        [changeTimer invalidate];
        changeTimer = nil;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGRect frame = CGRectMake(0, 0, dotSize, dotSize);
    for (NSInteger i = 0; i < 12; i++) {
        id obj = [self.redDots objectAtIndex:i];
        BOOL flag = [obj isKindOfClass:[NSArray class]];
        for (NSInteger j = 0; j < 12; j++) {
            __block UIColor *color = [UIColor colorWithRed:230 / 255.0 green:230 / 255.0 blue:230 / 255.0 alpha:1];
            if (flag) {
                [(NSArray *)obj enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    if ([obj intValue] == j) {
                        color = [UIColor redColor];
                    }
                }];
            }
            CGContextSetFillColorWithColor(context, color.CGColor);
            CGContextFillEllipseInRect(context, frame);
            
            float originX = frame.origin.x;
            originX = (originX + dotSize * 1.4f);
            frame.origin.x = originX;
        }
        
        float originX = frame.origin.x;
        float originY = frame.origin.y;
        originX = 0;
        originY = originY + dotSize * 1.4f;
        frame.origin.x = originX;
        frame.origin.y = originY;
    }
}

- (time_t)uptimeFun

{
    
    struct timeval boottime;
    
    int mib[2] = {CTL_KERN, KERN_BOOTTIME};
    
    size_t size = sizeof(boottime);
    
    time_t now;
    
    time_t uptime = -1;
    
    (void)time(&now);
    
    if (sysctl(mib, 2, &boottime, &size, NULL, 0) != -1 && boottime.tv_sec != 0)
        
        
        
    {
        
        uptime = now - boottime.tv_sec;
        
    }
    
    return uptime;
    
}


@end
