//
//  TriangleView.m
//  UIVinePullToRefresh
//
//  Created by Bill on 2/9/13.
//  Copyright (c) 2013 Bill Richards. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // bottom left
    CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMinY(rect));  // mid top
        CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));  // bottom right
    CGContextClosePath(ctx);
    
    CGContextSetRGBFillColor(ctx, 120.0f/255.0f, 120.0f/255.0f, 120.0f/255.0f, 1);
    CGContextFillPath(ctx);
}

@end
