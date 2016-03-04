//
//  MainViewController.m
//  ChaoXun
//
//  Created by zyc on 16/2/26.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "MainViewController.h"
#import "StarView.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *bottomBar;

// 爱心
@property (nonatomic, strong) CAReplicatorLayer *loveLayer;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    StarView *star = [[StarView alloc] init];
    star.radius = 50;
    star.frame = CGRectMake(20, 20, 100, 100);
    star.startColor = [UIColor yellowColor];
    star.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:star];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)waveLineReplicatorLayer
{
    //路径
    UIBezierPath *tpath = [UIBezierPath bezierPath];
    [tpath moveToPoint:CGPointMake(0, 40)];
    [tpath addLineToPoint:CGPointMake(80, 40)];
    [tpath addLineToPoint:CGPointMake(80, 20)];
    [tpath addLineToPoint:CGPointMake(160, 20)];
    [tpath addLineToPoint:CGPointMake(160, 40)];
    [tpath addLineToPoint:CGPointMake(240, 40)];
    [tpath addLineToPoint:CGPointMake(240, 20)];
    [tpath addLineToPoint:CGPointMake(320, 20)];
    [tpath closePath];
    
    
    // 具体的layer
    CALayer *anmiateLayer = [CALayer layer];
//    anmiateLayer.cornerRadius = 5;
    anmiateLayer.frame = CGRectMake(0, 0, 10, 10);
    anmiateLayer.backgroundColor = [UIColor whiteColor].CGColor;
    anmiateLayer.shadowColor = [UIColor greenColor].CGColor;
    anmiateLayer.borderWidth = 3;
    anmiateLayer.borderColor = [UIColor whiteColor].CGColor;
    
    
    //动作效果c
    CAKeyframeAnimation *oneAnimate = [CAKeyframeAnimation animation];
    oneAnimate.keyPath = @"position";
    oneAnimate.path = tpath.CGPath;
    oneAnimate.duration = 8;
    oneAnimate.repeatCount = 2;
    oneAnimate.calculationMode = @"cubicPaced";
    
    //改变大小
    CABasicAnimation *scaleAnimate = [CABasicAnimation animation];
    scaleAnimate.keyPath = @"transform.rotation";
    scaleAnimate.fromValue = @(M_PI);
    scaleAnimate.toValue = @(0);
    scaleAnimate.duration = 0.4;
    scaleAnimate.repeatCount = MAXFLOAT;
    
    
    //复制layer
    //生成CAReplicatorLayer
    CAReplicatorLayer *waveLayer = [CAReplicatorLayer layer];
    //复制图层共十个
    waveLayer.instanceCount = 100;
    //每个图层出现间隔时间
    waveLayer.instanceDelay = 0.12;
    //
    waveLayer.instanceColor = [UIColor whiteColor].CGColor;
    //颜色递减
    waveLayer.instanceGreenOffset = -0.005;
    waveLayer.instanceBlueOffset = -0.1;
    waveLayer.instanceRedOffset = -0.01;
    
//    waveLayer.affineTransform = CGAffineTransformMakeRotation(0.5);
    
    
    [waveLayer addSublayer:anmiateLayer];
    [self.bottomBar.layer addSublayer:waveLayer];
    
    
    
    [anmiateLayer addAnimation:scaleAnimate forKey:@"scaleAnimate"];
    [anmiateLayer addAnimation:oneAnimate forKey:@"waveAnimate"];



}
- (void)starReplicatorLayer_image
{
    //路径
    UIBezierPath *tpath = [UIBezierPath bezierPath];
    [tpath moveToPoint:CGPointMake(0, 40)];
    [tpath addLineToPoint:CGPointMake(80, 40)];
    [tpath addLineToPoint:CGPointMake(80, 20)];
    [tpath addLineToPoint:CGPointMake(160, 20)];
    [tpath addLineToPoint:CGPointMake(160, 40)];
    [tpath addLineToPoint:CGPointMake(240, 40)];
    [tpath addLineToPoint:CGPointMake(240, 20)];
    [tpath addLineToPoint:CGPointMake(320, 20)];
    [tpath closePath];
    
    
    // 具体的layer

    UIImageView *star = [[UIImageView alloc] init];
    star.frame = CGRectMake(0, 0, 10, 10);
    star.image = [UIImage imageNamed:@"star"];
//    star.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //动作效果c
    CAKeyframeAnimation *oneAnimate = [CAKeyframeAnimation animation];
    oneAnimate.keyPath = @"position";
    oneAnimate.path = tpath.CGPath;
    oneAnimate.duration = 8;
    oneAnimate.repeatCount = 2;
    //    oneAnimate.calculationMode = @"cubicPaced";
    
    //改变大小
    CABasicAnimation *scaleAnimate = [CABasicAnimation animation];
    scaleAnimate.keyPath = @"transform.rotation";
    scaleAnimate.fromValue = @(M_PI);
    scaleAnimate.toValue = @(0);
    scaleAnimate.duration = 0.8;
    scaleAnimate.repeatCount = MAXFLOAT;
    
    
    //复制layer
    //生成CAReplicatorLayer
    CAReplicatorLayer *waveLayer = [CAReplicatorLayer layer];
    //复制图层共十个
    waveLayer.instanceCount = 100;
    //每个图层出现间隔时间
    waveLayer.instanceDelay = 0.2;
    //
    waveLayer.instanceColor = [UIColor yellowColor].CGColor;
//    //颜色递减
//    waveLayer.instanceGreenOffset = -0.5;
//    waveLayer.instanceBlueOffset = -0.1;
//    waveLayer.instanceRedOffset = -1;
    
    //    waveLayer.affineTransform = CGAffineTransformMakeRotation(0.5);
    
    [star.layer addAnimation:oneAnimate forKey:@"waveAnimate"];
    
    
    [waveLayer addSublayer:star.layer];
    [self.bottomBar.layer addSublayer:waveLayer];
    //    [self.bottomBar addSubview:star];
    //    [self.bottomBar.layer addSublayer:star.layer];
    
        [star.layer addAnimation:scaleAnimate forKey:@"scaleAnimate"];
    
    
    
}
- (void)starReplicatorLayer
{
    //路径
    UIBezierPath *tpath = [UIBezierPath bezierPath];
    [tpath moveToPoint:CGPointMake(0, 40)];
    [tpath addLineToPoint:CGPointMake(80, 40)];
    [tpath addLineToPoint:CGPointMake(80, 20)];
    [tpath addLineToPoint:CGPointMake(160, 20)];
    [tpath addLineToPoint:CGPointMake(160, 40)];
    [tpath addLineToPoint:CGPointMake(240, 40)];
    [tpath addLineToPoint:CGPointMake(240, 20)];
    [tpath addLineToPoint:CGPointMake(320, 20)];
    [tpath closePath];
    
    
    // 具体的layer
//    CALayer *anmiateLayer = [CALayer layer];
//    //    anmiateLayer.cornerRadius = 5;
//    anmiateLayer.frame = CGRectMake(0, 0, 10, 10);
//    anmiateLayer.backgroundColor = [UIColor whiteColor].CGColor;
//    anmiateLayer.shadowColor = [UIColor greenColor].CGColor;
//    anmiateLayer.borderWidth = 3;
//    anmiateLayer.borderColor = [UIColor whiteColor].CGColor;
//    
    
    StarView *star = [[StarView alloc] init];
    star.radius = 5;
    star.frame = CGRectMake(0, 0, 10, 10);
    star.startColor = [UIColor yellowColor];
    star.layer.backgroundColor = [UIColor clearColor].CGColor;
//    star.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    
    
    //动作效果c
    CAKeyframeAnimation *oneAnimate = [CAKeyframeAnimation animation];
    oneAnimate.keyPath = @"position";
    oneAnimate.path = tpath.CGPath;
    oneAnimate.duration = 8;
    oneAnimate.repeatCount = 2;
//    oneAnimate.calculationMode = @"cubicPaced";
    
    //改变大小
    CABasicAnimation *scaleAnimate = [CABasicAnimation animation];
    scaleAnimate.keyPath = @"transform.rotation";
    scaleAnimate.fromValue = @(M_PI);
    scaleAnimate.toValue = @(0);
    scaleAnimate.duration = 0.8;
    scaleAnimate.repeatCount = MAXFLOAT;
    
    
    //复制layer
    //生成CAReplicatorLayer
    CAReplicatorLayer *waveLayer = [CAReplicatorLayer layer];
    //复制图层共十个
    waveLayer.instanceCount = 100;
    //每个图层出现间隔时间
    waveLayer.instanceDelay = 0.2;
    //
    waveLayer.instanceColor = [UIColor yellowColor].CGColor;
    //颜色递减
    waveLayer.instanceGreenOffset = -0.5;
    waveLayer.instanceBlueOffset = -0.1;
    waveLayer.instanceRedOffset = -1;
    
    //    waveLayer.affineTransform = CGAffineTransformMakeRotation(0.5);
    
    [star.layer addAnimation:oneAnimate forKey:@"waveAnimate"];

    
    [waveLayer addSublayer:star.layer];
    [self.bottomBar.layer addSublayer:waveLayer];
//    [self.bottomBar addSubview:star];
//    [self.bottomBar.layer addSublayer:star.layer];
    
//    [star.layer addAnimation:scaleAnimate forKey:@"scaleAnimate"];
    
    
    
}
- (void)loveReplicatorLayer
{
    
    // love路径
    UIBezierPath *tPath = [UIBezierPath bezierPath];
    [tPath moveToPoint:CGPointMake(SCREEN_WIDTH/2.0, 200)];
    [tPath addQuadCurveToPoint:CGPointMake(SCREEN_WIDTH/2.0, 400) controlPoint:CGPointMake(SCREEN_WIDTH/2.0 + 200, 20)];
    [tPath addQuadCurveToPoint:CGPointMake(SCREEN_WIDTH/2.0, 200) controlPoint:CGPointMake(SCREEN_WIDTH/2.0 - 200, 20)];
    [tPath closePath];
    
    // 具体的layer
    UIView *tView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    tView.center = CGPointMake(SCREEN_WIDTH/2.0, 200);
    tView.layer.cornerRadius = 5;
    tView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    // 动作效果
    CAKeyframeAnimation *loveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    loveAnimation.path = tPath.CGPath;
    loveAnimation.duration = 8;
    loveAnimation.repeatCount = MAXFLOAT;
    [tView.layer addAnimation:loveAnimation forKey:@"loveAnimation"];
    
    _loveLayer = [CAReplicatorLayer layer];
    _loveLayer.instanceCount = 40;                // 40个layer
    _loveLayer.instanceDelay = 0.2;               // 每隔0.2出现一个layer
    _loveLayer.instanceColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
    _loveLayer.instanceGreenOffset = -0.03;       // 颜色值递减。
    _loveLayer.instanceRedOffset = -0.02;         // 颜色值递减。
    _loveLayer.instanceBlueOffset = -0.01;        // 颜色值递减。
    
    
    [_loveLayer addSublayer:tView.layer];
    [self.view.layer addSublayer:_loveLayer];
}
-(void)playTestAnimate
{
    
    

    
//    [self.anmiateLayer addAnimation:self.oneAnimate forKey:@"oneAnimate"];
    
    
//    [self loveReplicatorLayer];
//    [self waveLineReplicatorLayer];
//    [self starReplicatorLayer];
    [self starReplicatorLayer_image];

}

-(void)pushBlockAnimate
{
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(100, 250, 3000, 30)];
    barView.backgroundColor = [UIColor yellowColor];
    barView.tag = 10001;
    [self.view addSubview:barView];
    
    for (int i = 1; i<20; i ++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, 30, 30)];
        label.text = [NSString stringWithFormat:@"%d",i];
        label.backgroundColor = [UIColor redColor];
        label.tag = 100 +i;
        [barView addSubview:label];
        
    }
    
    
    
    
    for (int i = 1; i<20; i++) {
        UILabel *label = [self.view viewWithTag:i+100];
        
        if (i!=5) {
            [UIView animateWithDuration:1 delay:i*1 options:UIViewAnimationOptionCurveEaseIn animations:^{
                label.left = (i-1)*30;
            } completion:^(BOOL finished) {
                //            [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                //                label.right = 0;
                //            } completion:^(BOOL finished) {
                //
                //            }];
            }];
        }else{
            
            [self move];
            [UIView animateWithDuration:1 delay:i*1 options:UIViewAnimationOptionCurveEaseIn animations:^{
                label.left = (i-1)*30;
            } completion:^(BOOL finished) {
                
            }];
        }
        
        
        
    }
    
    
}

-(void)move
{
    UIView *barView = [self.view viewWithTag:10001];
    
    [UIView animateWithDuration:100 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        barView.right = 0;
    } completion:^(BOOL finished) {
        
    }];
    
}


#pragma mark - 粒子效果

//路径


@end
