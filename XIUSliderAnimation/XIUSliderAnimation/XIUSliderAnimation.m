//
//  XIUSliderAnimation.m
//  XIUSliderAnimation
//
//  Created by A-XIU on 16/9/7.
//  Copyright © 2016年 XIU. All rights reserved.
//

#import "XIUSliderAnimation.h"

@interface XIUSliderAnimation ()
{
    CABasicAnimation *currentAnimation;

}
@property (strong, nonatomic) UIColor *shadowBackgroundColor;
@property (strong, nonatomic) UIColor *shadowForegroundColor;
@property (assign, nonatomic) CGFloat sliderWidth;
@property (assign, nonatomic) CGFloat repeatCount;
@property (assign, nonatomic) NSTimeInterval duration;


@end

@implementation XIUSliderAnimation

-(instancetype)initWithWidth:(CGFloat)sliderWidth Duration:(NSTimeInterval)duration {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.shadowBackgroundColor = [UIColor colorWithWhite:1. alpha:.5];
    self.shadowForegroundColor = [UIColor whiteColor];
    
    self.sliderWidth = sliderWidth;
    self.repeatCount = HUGE_VALF;
    self.duration = duration;
    return self;
}


- (void)startAnimation {
    if(!self.animatedView){
        return;
    }

    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.animatedView.bounds;
    
    CGFloat gradientSize = self.sliderWidth / self.animatedView.frame.size.width;
    
    NSArray *startLocations = @[@0,
                                [NSNumber numberWithFloat:(gradientSize / 2.)],
                                [NSNumber numberWithFloat:gradientSize]];
    NSArray *endLocations = @[[NSNumber numberWithFloat:(1. - gradientSize)],[NSNumber numberWithFloat:(1. - (gradientSize / 2.))],@1];
    
    
    gradient.colors = @[
                            (id)self.shadowBackgroundColor.CGColor,
                            (id)self.shadowForegroundColor.CGColor,
                            (id)self.shadowBackgroundColor.CGColor
                            ];
    gradient.locations = startLocations;
    gradient.startPoint = CGPointMake(0 - (gradientSize * 2), .5);
    gradient.endPoint = CGPointMake(1 + gradientSize, .5);
    
    self.animatedView.layer.mask = gradient;
    currentAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    currentAnimation.fromValue = startLocations;
    currentAnimation.toValue = endLocations;
    currentAnimation.repeatCount = self.repeatCount;
    currentAnimation.duration  = self.duration;
    currentAnimation.delegate = self;

    
    [gradient addAnimation:currentAnimation forKey:@"XIUSliderAnimation"];

}



#pragma mark CAAnimation Delelgate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)finished
{
    if(anim == currentAnimation){
        if(self.animatedView && self.animatedView.layer.mask){
            [self.animatedView.layer.mask removeAnimationForKey:@"XIUSliderAnimation"];
            self.animatedView.layer.mask = nil;
            currentAnimation = nil;
        }

    }
}

@end
