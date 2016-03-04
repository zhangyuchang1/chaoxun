//
//  StarView.m
//  ChaoXun
//
//  Created by zyc on 16/3/4.
//  Copyright © 2016年 zyc. All rights reserved.
//

#import "StarView.h"
@interface StarView()
@property (nonatomic,assign) CGFloat value;
@end

@implementation StarView


- (void)drawRect:(CGRect)rect
{
    
    
    CGFloat centerX = rect.size.width / 2;
    CGFloat centerY = rect.size.height / 2;
    
    //
    CGFloat th = M_PI/360 *2;
    
    CGFloat r0 = self.radius * sin(18 * th)/cos(36 * th); /*计算小圆半径r0 */
    CGFloat x1[5]={0},y1[5]={0},x2[5]={0},y2[5]={0};
    
    for (int i = 0; i < 5; i ++)
    {
        x1[i] = centerX + self.radius * cos((90 + i * 72) * th); /* 计算出大圆上的五个平均分布点的坐标*/
        y1[i]=centerY - self.radius * sin((90 + i * 72) * th);
        x2[i]=centerX + r0 * cos((54 + i * 72) * th); /* 计算出小圆上的五个平均分布点的坐标*/
        y2[i]=centerY - r0 * sin((54 + i * 72) * th);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef startPath = CGPathCreateMutable();
    CGPathMoveToPoint(startPath, NULL, x1[0], y1[0]);
    
    
    for (int i = 1; i < 5; i ++) {
        
        
        CGPathAddLineToPoint(startPath, NULL, x2[i], y2[i]);
        CGPathAddLineToPoint(startPath, NULL, x1[i], y1[i]);
    }
    
    CGPathAddLineToPoint(startPath, NULL, x2[0], y2[0]);
    CGPathCloseSubpath(startPath);
    
    
    CGContextAddPath(context, startPath);
    
    CGContextSetFillColorWithColor(context, self.startColor.CGColor);
    
    CGContextSetStrokeColorWithColor(context, self.startColor.CGColor);
    CGContextStrokePath(context);
    
    //填充 0~ 1
    self.value = 0.5;
    
    CGRect range = CGRectMake(x1[1], 0, (x1[4] - x1[1]) * self.value , y1[2]);
    
    CGContextAddPath(context, startPath);
    CGContextClip(context);
    CGContextFillRect(context, range);
    
    
    CFRelease(startPath);
    
    
    
}
@end
