//
//  MYView3.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-16.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "MYView3.h"

@implementation MYView3

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    /**
     *  So for example, if you have a dash pattern of {10, 10}, then you will draw 10 points, then skip 10 points, and repeat.
        As another example if your dash pattern is {10, 20, 30}, then you draw 10 points, skip 20 points, draw 30 points,
          skip 10 points, draw 20 points, skip 30 points, and repeat.
     */
    CGFloat dashArray[] = {5, 10, 15};
    //第二个参数表示 在第一个虚线绘制的时候跳过多少个点
    //最后一个参数对应 dashArray的长度
    CGContextSetLineDash(context, 0, dashArray, sizeof(dashArray) / sizeof(dashArray[0]));
    CGContextAddEllipseInRect(context, CGRectMake(5, 5, 100, 100));
    CGContextSetLineWidth(context, 3);
    CGContextStrokePath(context);
}

@end
