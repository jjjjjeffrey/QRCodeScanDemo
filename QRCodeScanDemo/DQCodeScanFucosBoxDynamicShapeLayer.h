//
//  DQCodeScanFucosBoxDynamicShapeLayer.h
//  QRCodeScanDemo
//
//  Created by zeng daqian on 14-9-1.
//  Copyright (c) 2014年 daqian. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface DQCodeScanFucosBoxDynamicShapeLayer : CAShapeLayer

- (instancetype)initWithView:(UIView *)view;
- (void)startBoxAnimation;
- (void)fucosToPath:(CGPathRef)path;

+ (NSArray *)translatePoints:(NSArray *)points fromLayer:(CALayer *)fromLayer toLayer:(CALayer *)toLayer;

@end
