//
//  UIBezierPath+DQCodeScanFucosBoxPath.m
//  QRCodeScanDemo
//
//  Created by zeng daqian on 14-9-1.
//  Copyright (c) 2014年 daqian. All rights reserved.
//

#import "UIBezierPath+DQCodeScanFucosBoxPath.h"

@implementation UIBezierPath (DQCodeScanFucosBoxPath)

+ (UIBezierPath *)createPathFromPoints:(NSArray *)points
{
    
    UIBezierPath *path = [UIBezierPath new];
    
    [path moveToPoint:[[points firstObject] CGPointValue]];
    [path addLineToPoint:[[points lastObject] CGPointValue]];
    [path addLineToPoint:[points[2] CGPointValue]];
    [path addLineToPoint:[points[1] CGPointValue]];
    [path addLineToPoint:[[points firstObject] CGPointValue]];
    
    return path;
}

@end
