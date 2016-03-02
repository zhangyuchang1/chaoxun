//
//  AddressItemView.m
//  ChaoXun
//
//  Created by zyc on 16/3/1.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "AddressItemView.h"

@implementation AddressItemView

#define Label_TAG  1001
- (void)drawRect:(CGRect)rect {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:18];
    label.text = @"佳佳";
    label.tag = Label_TAG;
    [self addSubview:label];
    
    
    UIButton *b = [[UIButton alloc] initWithFrame:label.frame];
    [b addTarget:self action:@selector(chancle) forControlEvents:UIControlEventTouchUpOutside];
    [b addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchDown];
 
    [self addSubview:b];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self shakeAnimate];
    NSLog(@"开始触摸");
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
    
    [self.layer removeAllAnimations];
    for (UIView *view in self.subviews) {
        [view.layer removeAllAnimations];
    }
    [self stopAnimate];

}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸取消");

}

#pragma mark - 动画

-(void)shakeAnimate
{
    //label颤抖  不好停止
//    UILabel *label = [self viewWithTag:Label_TAG];
//    CGAffineTransform  transformIdentifer =  self.transform;
//    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat animations:^{
//        CGAffineTransform  rotate = CGAffineTransformRotate(transformIdentifer, M_PI/6);
//        self.transform = rotate;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:2  delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//            CGAffineTransform  rotate = CGAffineTransformMakeRotation(-M_PI/6);
//            
//            self.transform = rotate;
//            
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//                self.transform = transformIdentifer;
//            } completion:^(BOOL finished) {
////                [self shakeAnimate];
//            }];
//            
//
//        }];
//        
//        
//    }];
    
    CABasicAnimation *shakAnimate1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    shakAnimate1.autoreverses = YES;
//    shakAnimate1.repeatDuration = HUGE_VALF;
    shakAnimate1.duration = 1;
    shakAnimate1.fromValue = [NSNumber numberWithFloat:-M_PI/6];
    shakAnimate1.toValue=[NSNumber numberWithFloat:M_PI/6];
//    [self.layer addAnimation:shakAnimate1 forKey:@"appDeleteShakeAnimation"];
    
    CABasicAnimation *shakAnimate2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    shakAnimate2.autoreverses = YES;
//    shakAnimate1.repeatDuration = HUGE_VALF;
    shakAnimate2.duration = 1;
    shakAnimate2.fromValue = [NSNumber numberWithFloat:M_PI/6];
    shakAnimate2.toValue=[NSNumber numberWithFloat:-M_PI/6];
//    [self.layer addAnimation:shakAnimate2 forKey:@"appDeleteShakeAnimation"];
    
    CAAnimationGroup *shakAnimate = [CAAnimationGroup animation];
    shakAnimate.animations = @[shakAnimate1,shakAnimate2];
//    shakAnimate1.repeatDuration = HUGE_VALF;
    shakAnimate.autoreverses = YES;
    shakAnimate.repeatCount = 5;
    shakAnimate.duration = 2;
    [self.layer addAnimation:shakAnimate forKey:@"appDeleteShakeAnimation"];
}


-(void)stopAnimate
{
    UILabel *label = [self viewWithTag:Label_TAG];

    [UIView animateWithDuration:0.1 animations:^{
        CGAffineTransform  transformIdentifer =  self.transform;
        CGAffineTransform  rotate = CGAffineTransformRotate(transformIdentifer, 0.1);
        self.transform = rotate;
    }];
}

-(void)touch
{
    [self shakeAnimate];
}
-(void)chancle
{
    [self stopAnimate];
}
@end
