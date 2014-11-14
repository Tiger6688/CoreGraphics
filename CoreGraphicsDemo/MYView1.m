//
//  MYView1.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-15.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "MYView1.h"

@implementation MYView1

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
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextFillRect(context, rect);
    CGContextClearRect(context, CGRectMake(0, 0, 30, 30));
}


@end
