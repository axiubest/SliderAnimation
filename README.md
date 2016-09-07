# SliderAnimation
仿苹果滑动来解锁动画
# 对指定控件添加滑动解锁效果动画，纯代码和xib加载代码都可实现效果

<!---->对遮罩层进行初始化

    self.animation = [[XIUSliderAnimation alloc] initWithWidth:60 Duration:2];
<!----> 选定执行动画的控件，

    self.animation.animatedView = button;

<!---->在视图将要出现处调用动画开始方法

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    [self.animation startAnimation];
}
