//
//  ZYDrawView.m
//  单线粒子效果
//
//  Created by 王志盼 on 16/2/16.
//  Copyright © 2016年 王志盼. All rights reserved.
//

#import "ZYDrawView.h"

@interface ZYDrawView ()
@property (nonatomic, strong) UIBezierPath *bezierPath;

@property (nonatomic, weak) CAReplicatorLayer *replicatorLayer;

@property (nonatomic, weak) CALayer *norLayer;
@end

static int _count = 0;

@implementation ZYDrawView

- (UIBezierPath *)bezierPath
{
    if (_bezierPath == nil) {
        _bezierPath = [[UIBezierPath alloc] init];
    }
    return _bezierPath;
}

- (void)awakeFromNib
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.bounds;
    [self.layer addSublayer:replicatorLayer];
    
    CALayer *layer = [CALayer layer];
    
    layer.frame = CGRectMake(0, -200, 10, 10);
    layer.cornerRadius = layer.frame.size.width * 0.5;
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    [replicatorLayer addSublayer:layer];
    
    self.replicatorLayer = replicatorLayer;
    self.norLayer = layer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint curPoint = [[touches anyObject] locationInView:self];
    
    [self.bezierPath moveToPoint:curPoint];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _count++;
    CGPoint curPoint = [[touches anyObject] locationInView:self];
    
    [self.bezierPath addLineToPoint:curPoint];
    
    [self setNeedsDisplay];
}

- (void)startAnimation
{
    CAKeyframeAnimation *keyframeAn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    keyframeAn.path = self.bezierPath.CGPath;
    
    keyframeAn.duration = 4;
    
    keyframeAn.repeatCount = MAXFLOAT;
    
    [self.norLayer addAnimation:keyframeAn forKey:nil];
    
    self.replicatorLayer.instanceCount = _count;
    
    self.replicatorLayer.instanceDelay = 0.1;
}

- (void)reDraw
{
    _bezierPath = nil;
    _count = 1;
    [self.norLayer removeAllAnimations];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [self.bezierPath stroke];
}

@end
