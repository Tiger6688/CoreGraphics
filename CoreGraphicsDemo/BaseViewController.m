//
//  BaseViewController.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-15.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "BaseViewController.h"
#import "MYView1.h"
#import "MYView2.h"
#import "MYView3.h"
#import "MYView4.h"
#import "MYView5.h"
#import "MYView6.h"
#import "SwirlyView.h"
#import "AnimationDrawView.h"
#import "DotMatrixView.h"
#import "CircleGradientProgressView.h"

@interface BaseViewController ()
{
    DotMatrixView *dotMatrixView;
    CircleGradientProgressView *gradientProgressView;
}
@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self twoSameImage];
    
//    [self drawByBezierPath];
//    [self drawByCGContextRef];
    
//    [self scaleImage];
//    [self cutImage];
//    [self cgimageTest];
//    [self cgimage1];
    
//    [self setup1];
    
//    [self setupSwirlyView];
    
//    [self setUpAnimationDrawView];
    
    
    dotMatrixView = [[DotMatrixView alloc]initWithFrame:CGRectMake(20, 100, 200, 200)];
    [self.view addSubview:dotMatrixView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"变化" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(20, 320, 100, 40)];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    gradientProgressView = [[CircleGradientProgressView alloc]initWithFrame:CGRectMake(150, 80, 120, 120)];
    gradientProgressView.progress = 0.2;
    [self.view addSubview:gradientProgressView];
}

- (void)change
{
    float progress = gradientProgressView.progress;
    progress = progress + arc4random_uniform(10) / 10.0;
    if (progress > 1.0) {
        progress = progress - 1.0f;
    }
    [gradientProgressView setProgress:progress animated:YES];
    
    static int index = 0;
    NSArray *array;
    if (index++ %2 == 0) {
        array = [[NSArray alloc]initWithObjects:
                 [NSNull null],
                 @[@2, @3, @4, @5, @6, @7],
                 @[@1, @2, @7, @8],
                 @[@1, @2, @7, @8],
                 @[@6, @7],
                 @[@5, @6],
                 @[@4, @5],
                 @[@4, @5],
                [NSNull null],
                 @[@4, @5],
                 @[@4, @5],
                 [NSNull null],
                 nil];
    }else{
        array = [[NSArray alloc]initWithObjects:
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
    [dotMatrixView changeImageByArray:array];
}

- (void)setupSwirlyView
{
    SwirlyView *view = [[SwirlyView alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
    [self.view addSubview:view];
    
    
    /*
    CALayer *swirlyLayer = [CALayer layer];
    swirlyLayer.frame = CGRectMake(60, 100, 200, 200);
    
    //不加下面的delegate将不会执行对应的
    //      - (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx 方法
    //不需要在ViewController声明后面添加delegate名称
    swirlyLayer.delegate  = self;
    [swirlyLayer setNeedsDisplay];
    [self.view.layer addSublayer:swirlyLayer];
     */

}

- (void)setUpAnimationDrawView
{
    AnimationDrawView *view = [[AnimationDrawView alloc]initWithFrame:CGRectMake(100, 150, 80, 80)];
    [self.view addSubview:view];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    float _thickness = 20;
    NSInteger _segmentCount = 4;
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextSetLineWidth(ctx, _thickness);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 8, [UIColor blackColor].CGColor);
    CGContextBeginPath(ctx);
    
    float start = 0.0;
    float step = M_PI / _segmentCount;
    float end = 0;
    
    float centerX = 100;
    float centerY = 100;
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

- (void)setup1
{
    /*
    MYView1 *view1 = [[MYView1 alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor clearColor];//不添加，则裁剪区域为黑色
    [self.view addSubview:view1];
    
    MYView2 *view2 = [[MYView2 alloc]initWithFrame:CGRectMake(100, 240, 0, 0)];
    [self.view addSubview:view2];
    
    MYView3 *view3 = [[MYView3 alloc]initWithFrame:CGRectMake(100, 350, 110, 110)];
    [self.view addSubview:view3];
     */
    
//    MYView4 *view4 = [[MYView4 alloc]initWithFrame:CGRectMake(50, 100, 220, 220)];
//    [self.view addSubview:view4];
    
//    MYView5 *view5 = [[MYView5 alloc]initWithFrame:CGRectMake(50, 40, 128, 128)];
//    [self.view addSubview:view5];
    
    MYView6 *view6 = [[MYView6 alloc]initWithFrame:CGRectMake(50, 40, 190, 190)];
    [self.view addSubview:view6];
}

//和 cgimageTestWith2x 功能一致
/*
 这样做有两大优点：
 1.当UIImage绘图时它会自动修复倒置问题
 2.当你从CGImage转化为Uimage时，可调用imageWithCGImage:scale:orientation:方法生成CGImage作为对缩放性的补偿。
 */
- (void)cgimage1
{
    UIImage* mars = [UIImage imageNamed:@"facebook"];
    
    CGSize sz = [mars size];
    
    CGImageRef marsCG = [mars CGImage];
    
    CGSize szCG = CGSizeMake(CGImageGetWidth(marsCG), CGImageGetHeight(marsCG));
    
    CGImageRef marsLeft = CGImageCreateWithImageInRect(marsCG, CGRectMake(0,0,szCG.width/2.0,szCG.height));
    
    CGImageRef marsRight = CGImageCreateWithImageInRect(marsCG, CGRectMake(szCG.width/2.0,0,szCG.width/2.0,szCG.height));
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width*1.5, sz.height), NO, 0);
    
    [[UIImage imageWithCGImage:marsLeft scale:[mars scale] orientation:UIImageOrientationUp] drawAtPoint:CGPointMake(0,0)];
    
    [[UIImage imageWithCGImage:marsRight scale:[mars scale] orientation:UIImageOrientationUp] drawAtPoint:CGPointMake(sz.width,0)];
    
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    
    [self showImage:im];
    
    UIGraphicsEndImageContext();
    
    CGImageRelease(marsLeft); CGImageRelease(marsRight);
}

//普通图片正常，高清图片就不正常了
/*
 128*128像素的 google.png UIImage对象的size为(128,128)
 128*128像素的 google@2x.png UIImage对象的size为(64,64)
 两种情况对应的CGImage对象的size都为(128,128)
 */
- (void)cgimageTest
{
    UIImage *img = [UIImage imageNamed:@"facebook"];
    CGSize size = img.size;
    
    CGImageRef imgRef = [img CGImage];
    
    CGSize imageRefSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    
    NSLog(@"size:%@",NSStringFromCGSize(size));
    NSLog(@"imageRefSize:%@",NSStringFromCGSize(imageRefSize));
    
    CGImageRef imgLeft = CGImageCreateWithImageInRect(img.CGImage, CGRectMake(0, 0, size.width / 2.0f, size.height));
    CGImageRef imgRight = CGImageCreateWithImageInRect(img.CGImage, CGRectMake(size.width / 2.0f, 0, size.width / 2.0f, size.height));
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width * 1.5, size.height), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, CGRectMake(0, 0, size.width / 2.0f, size.height), flip(imgLeft));
    CGContextDrawImage(context, CGRectMake(size.width, 0, size.width / 2.0f, size.height), flip(imgRight));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [self showImage:image];
    UIGraphicsEndImageContext();
    CGImageRelease(imgLeft);
    CGImageRelease(imgRight);
}

//适用于普通和@2x的高清图片
- (void)cgimageTestWith2x
{
    UIImage *img = [UIImage imageNamed:@"google"];
    CGSize size = img.size;
    
    CGImageRef imgRef = [img CGImage];
    
    CGSize imageRefSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    
    NSLog(@"size:%@",NSStringFromCGSize(size));
    NSLog(@"imageRefSize:%@",NSStringFromCGSize(imageRefSize));
    
    CGImageRef imgLeft = CGImageCreateWithImageInRect(imgRef, CGRectMake(0, 0, imageRefSize.width / 2.0f, imageRefSize.height));
    CGImageRef imgRight = CGImageCreateWithImageInRect(imgRef, CGRectMake(imageRefSize.width / 2.0f, 0, imageRefSize.width / 2.0f, imageRefSize.height));
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width * 1.5, size.height), NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, CGRectMake(0, 0, size.width / 2.0f, size.height), flip(imgLeft));
    CGContextDrawImage(context, CGRectMake(size.width, 0, size.width / 2.0f, size.height), flip(imgRight));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [self showImage:image];
    UIGraphicsEndImageContext();
    CGImageRelease(imgLeft);
    CGImageRelease(imgRight);
}

/**
 *  解决图片颠倒的问题
 *  图片的颠倒并不是因为被旋转了。当你创建了一个CGImage并使用CGContextDrawImage方法绘图就会引起这种问题。
 *  这主要是因为原始的本地坐标系统（坐标原点在左上角）与目标上下文（坐标原点在左下角）不匹配
 */
CGImageRef flip (CGImageRef im) {
    
    CGSize sz = CGSizeMake(CGImageGetWidth(im), CGImageGetHeight(im));
    
    UIGraphicsBeginImageContextWithOptions(sz, NO, 0);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, sz.width, sz.height), im);
    
    CGImageRef result = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
    
    UIGraphicsEndImageContext();
    
    return result; 
    
}

- (void)showImage:(UIImage *)image
{
    UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:imageV];
    imageV.center = self.view.center;
}

- (void)cutImage
{
    UIImage *img = [UIImage imageNamed:@"facebook"];
    CGSize size = img.size;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width / 2.0, size.height), NO, 0);
    [img drawAtPoint:CGPointMake(-size.width / 2.0, 0)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:imageV];
    imageV.center = self.view.center;
}

- (void)scaleImage
{
    UIImage *img = [UIImage imageNamed:@"facebook"];
    CGSize size = img.size;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width * 2, size.height * 2), NO, 0);
    [img drawInRect:CGRectMake(0, 0, size.width * 2, size.height * 2)];
    [img drawInRect:CGRectMake(size.width / 2.0f, size.height / 2.0f, size.width, size.height) blendMode:kCGBlendModeMultiply alpha:0.99];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:imageV];
    imageV.center = self.view.center;
}

- (void)twoSameImage
{
    UIImage *img = [UIImage imageNamed:@"facebook"];
    CGSize size = img.size;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width * 2, size.height), NO, 0);
    [img drawAtPoint:CGPointMake(0, 0)];
    [img drawAtPoint:CGPointMake(size.width, 0)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:imageV];
    imageV.center = self.view.center;
}

- (void)drawByBezierPath
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    [[UIColor greenColor] setFill];
    [path fill];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:imageV];
    imageV.center = self.view.center;
}

- (void)drawByCGContextRef
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(contextRef, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(contextRef, [UIColor orangeColor].CGColor);
    CGContextFillPath(contextRef);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
    [self.view addSubview:imageV];
    imageV.center = self.view.center;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
