//
//  TriangleRefreshView.m
//  UIVinePullToRefresh
//
//  Created by Bill on 2/9/13.
//  Copyright (c) 2013 Bill Richards. All rights reserved.
//

#import "TriangleRefreshView.h"
#import "TriangleView.h"

@implementation TriangleRefreshView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        float ySpace = 5.0f;
        float triangleHeight = 10.0f;
        
        self.tv = [[TriangleView alloc] initWithFrame:CGRectMake(0, 0, 15, triangleHeight)];
        self.tv.center = CGPointMake(self.frame.size.width/2, self.tv.frame.origin.y+triangleHeight/2);
        [self addSubview:self.tv];
        
        self.tv2 = [[TriangleView alloc] initWithFrame:CGRectMake(0, self.tv.frame.origin.y+triangleHeight+ySpace, 15, triangleHeight)];
        self.tv2.center = CGPointMake(self.frame.size.width/2, self.tv2.frame.origin.y+triangleHeight/2);
        [self addSubview:self.tv2];
        
        self.tv3 = [[TriangleView alloc] initWithFrame:CGRectMake(0, self.tv2.frame.origin.y+triangleHeight+ySpace, 15, triangleHeight)];
        self.tv3.center = CGPointMake(self.frame.size.width/2, self.tv3.frame.origin.y+triangleHeight/2);
        [self addSubview:self.tv3];
    }
    return self;
}

@end
