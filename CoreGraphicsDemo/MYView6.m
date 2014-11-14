
//
//  MYView6.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-18.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "MYView6.h"

@implementation MYView6
{
    CGImageRef _maskingImage;
    CGImageRef _alphaImage;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self createImages];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat height = self.bounds.size.height;
    CGContextTranslateCTM(context, 0, height);
    CGContextScaleCTM(context, 1, -1);
    
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextSaveGState(context);
    CGContextClipToMask(context, CGRectMake(0, 0, 90, 90), _alphaImage);
    CGContextFillRect(context, CGRectMake(0, 0, 90, 90));
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextClipToMask(context, CGRectMake(100, 100, 90, 90), _maskingImage);
    CGContextFillRect(context, CGRectMake(100, 100, 90, 90));
    CGContextRestoreGState(context);
}

- (void)createImages
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"logo_door_normal.png" ofType:nil];
    UIImage *img = [UIImage imageWithContentsOfFile:imagePath];
    _alphaImage = CGImageRetain(img.CGImage);
    
    NSMutableData *data = [NSMutableData dataWithLength:90 * 90 * 1];
    CGContextRef context = CGBitmapContextCreate([data mutableBytes], 90, 90, 8, 90, NULL, (CGBitmapInfo)kCGImageAlphaOnly);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    CGContextDrawImage(context, CGRectMake(0, 0, 90, 90), _alphaImage);
    CGContextRelease(context);
    CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData((__bridge CFMutableDataRef)data);
    _maskingImage = CGImageMaskCreate(90, 90, 8, 8, 90, dataProvider, NULL, YES);
    CGDataProviderRelease(dataProvider);
    
}

@end
