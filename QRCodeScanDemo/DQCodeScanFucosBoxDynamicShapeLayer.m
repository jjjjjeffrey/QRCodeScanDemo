//
//  DQCodeScanFucosBoxDynamicShapeLayer.m
//  QRCodeScanDemo
//
//  Created by zeng daqian on 14-9-1.
//  Copyright (c) 2014年 daqian. All rights reserved.
//

#import "DQCodeScanFucosBoxDynamicShapeLayer.h"

@implementation DQCodeScanFucosBoxDynamicShapeLayer

- (instancetype)initWithView:(UIView *)view
{
    if ([super init]) {
        self.frame = view.frame;
        
    }
    return self;
}

- (void)startBoxAnimation
{
    CGMutablePathRef aPath = CGPathCreateMutable();
    CGPathAddRect(aPath, NULL, CGRectMake(32.5, 249, 252, 72));
    
    CGMutablePathRef bPath = CGPathCreateMutable();
    CGPathAddRect(bPath, NULL, CGRectMake(68.5, 195, 180, 180));
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 1.5;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = (__bridge_transfer id)aPath;
    animation.toValue = (__bridge_transfer id)bPath;
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    [self addAnimation:animation forKey:@"path_animation"];
}

- (void)fucosToPath:(CGPathRef)path
{
    CGPathRef bPath = CGPathCreateCopy(path);
    [self removeAnimationForKey:@"path_animation"];
    
    CALayer* presentLayer = self.presentationLayer;
    id currentPath = [presentLayer valueForKeyPath:@"path"];
    self.path = (__bridge CGPathRef)(currentPath);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 0.2;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fromValue = currentPath;
    animation.toValue = (__bridge_transfer id)bPath;
    [self addAnimation:animation forKey:@"qrpath"];
    self.path = bPath;
    self.backgroundColor = [UIColor blackColor].CGColor;
    self.opacity = 0.6;
}

+ (NSArray *)translatePoints:(NSArray *)points fromLayer:(CALayer *)fromLayer toLayer:(CALayer *)toLayer
{
    NSMutableArray *translatedPoints = [NSMutableArray new];
    
    for (NSDictionary *point in points) {
        CGPoint pointValue = CGPointMake([point[@"X"] floatValue], [point[@"Y"] floatValue]);
        CGPoint translatedPoint = [fromLayer convertPoint:pointValue toLayer:toLayer];
        [translatedPoints addObject:[NSValue valueWithCGPoint:translatedPoint]];
    }
    
    return [translatedPoints copy];
}

@end
