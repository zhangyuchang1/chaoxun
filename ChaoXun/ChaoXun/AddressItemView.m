//
//  AddressItemView.m
//  ChaoXun
//
//  Created by zyc on 16/3/1.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "AddressItemView.h"
#import "MainViewController.h"

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
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self shakeAnimate1];
    NSLog(@"开始触摸");
    [self paly];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
    
    [self.layer removeAllAnimations];
    for (UIView *view in self.subviews) {
        [view.layer removeAllAnimations];
    }

}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸取消");

}

#pragma mark - 动画
//左右摇晃
-(void)shakeAnimate1
{
    //label颤抖  不好停止
    UILabel *label = [self viewWithTag:Label_TAG];
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
    shakAnimate1.duration = 0.1;
    shakAnimate1.fromValue = [NSNumber numberWithFloat:-M_PI/6];
    shakAnimate1.toValue=[NSNumber numberWithFloat:M_PI/6];
//    [self.layer addAnimation:shakAnimate1 forKey:@"appDeleteShakeAnimation"];
    
    CABasicAnimation *shakAnimate2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    shakAnimate2.autoreverses = YES;
//    shakAnimate1.repeatDuration = HUGE_VALF;
    shakAnimate2.duration = 0.1;
    shakAnimate2.fromValue = [NSNumber numberWithFloat:M_PI/6];
    shakAnimate2.toValue=[NSNumber numberWithFloat:-M_PI/6];
//    [self.layer addAnimation:shakAnimate2 forKey:@"appDeleteShakeAnimation"];
    
    CAAnimationGroup *shakAnimate = [CAAnimationGroup animation];
    shakAnimate.animations = @[shakAnimate1,shakAnimate2];
//    shakAnimate1.repeatDuration = HUGE_VALF;
    shakAnimate.autoreverses = YES;
    shakAnimate.repeatCount = 100;
    shakAnimate.duration = 0.2;
    [label.layer addAnimation:shakAnimate forKey:@"appDeleteShakeAnimation"];
    
}

-(void)paly
{
    MainViewController *mainVC = (MainViewController *)self.viewController;
    [mainVC playTestAnimate];
    
}

//

@end
