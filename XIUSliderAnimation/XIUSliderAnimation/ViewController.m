//
//  ViewController.m
//  XIUSliderAnimation
//
//  Created by A-XIU on 16/9/7.
//  Copyright © 2016年 XIU. All rights reserved.
//

#import "ViewController.h"
#import "XIUSliderAnimation.h"
@interface ViewController ()
@property (nonatomic, strong)XIUSliderAnimation *animation;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.animation startAnimation];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];

    
    
    //创建一个控件
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 100, 300, 50);
    [button setTitle:@"f i r s t B t n" forState:UIControlStateNormal];

    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor orangeColor].CGColor;
    button.layer.cornerRadius = 5.0;
    button.layer.masksToBounds = YES;
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didClickedButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    ---------------- 添加遮罩层--------------------
/**
 参数介绍：
 *color: 动画颜色
  width: 动画宽度
  duration:动画持续时间
 */
    self.animation = [[XIUSliderAnimation alloc] initWithWidth:60 Duration:2];

//    选定执行动画的控件
    self.animation.animatedView = button;
    
}


- (void)didClickedButton {
    NSLog(@"button chicked");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
