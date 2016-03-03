//
//  DrawView.m
//  ChaoXun
//
//  Created by zyc on 16/3/3.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "DrawView.h"
@interface DrawView ()

@property (nonatomic, strong) UIBezierPath *path;

@property (nonatomic, assign) CGPoint startP;

@property (nonatomic, strong)  CALayer *dotLayer;
@property (nonatomic, strong)  CAReplicatorLayer *repLayer;
@property (nonatomic, strong)  CAKeyframeAnimation *anim;

@end

@implementation DrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIBezierPath *)path
{
    if (_path == nil) {
        _path = [UIBezierPath bezierPath];
    }
    return _path;
}

- (CAReplicatorLayer *)repLayer
{
    if (_repLayer == nil) {
        _repLayer = [CAReplicatorLayer layer];
        _repLayer.instanceCount = 20;
        _repLayer.instanceDelay = 4 / 20.0;
        _repLayer.frame = self.bounds;
        // 设置子层颜色
        _repLayer.instanceColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1].CGColor;
        // 设置子层颜色绿色通道偏移量
        _repLayer.instanceGreenOffset = -0.03;
        
    }
    return _repLayer;
}

- (CALayer *)dotLayer
{
    if (_dotLayer == nil) {
        // 创建粒子图层
        _dotLayer = [CALayer layer];
        _dotLayer.cornerRadius = 5;
        _dotLayer.frame = CGRectMake(-100, 10, 10, 10);
        _dotLayer.backgroundColor = [UIColor whiteColor].CGColor;
    }
    return _dotLayer;
}
- (CAKeyframeAnimation *)anim
{
    if (_anim == nil) {
        _anim = [CAKeyframeAnimation animation];
        
        _anim.keyPath = @"position";
        _anim.duration = 4;
        
        _anim.repeatCount = MAXFLOAT;
        _anim.delegate = self;
    }
    return  _anim;
}

- (void)awakeFromNib
{
    // 添加pan手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self addGestureRecognizer:pan];
    
    
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(startAnim)];
    [self addGestureRecognizer:tap];
    
    // 创建复制图层
    [self.layer addSublayer:self.repLayer];
    [self.repLayer addSublayer:self.dotLayer];}

- (void)reDraw
{
    self.path = nil;
    [self.dotLayer removeAnimationForKey:@"anim"];
    [self setNeedsDisplay];
}

- (void)startAnim
{
    self.anim.path = self.path.CGPath;
    [self.dotLayer addAnimation:self.anim forKey:@"anim"];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint curP = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {
        _startP = curP;
        [self.path moveToPoint:_startP];
    }
    
    [self.path addLineToPoint:curP];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.path stroke];
}
@end
