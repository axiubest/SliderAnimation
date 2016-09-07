//
//  XIUSliderAnimation.h
//  XIUSliderAnimation
//
//  Created by A-XIU on 16/9/7.
//  Copyright © 2016年 XIU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XIUSliderAnimation : NSObject
@property (weak, nonatomic) UIView *animatedView;

- (void)startAnimation;

-(instancetype)initWithWidth:(CGFloat)sliderWidth Duration:(NSTimeInterval)duration;

@end
