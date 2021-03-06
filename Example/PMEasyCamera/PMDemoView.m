#import "PMDemoView.h"

@interface PMDemoView() <ESCObservableInternal>

@property (nonatomic) UIButton *button;

@end

@implementation PMDemoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self escRegisterObserverProtocol:@protocol(PMDemoViewObserver)];
    _button = [[UIButton alloc] init];
    [self addSubview:self.button];
    [self.button addTarget:self
                    action:@selector(cameraClicked)
          forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.button.titleLabel.text = @"camera";
    [self.button setTitle:@"camera" forState:UIControlStateNormal];
    [self.button sizeToFit];
    self.button.backgroundColor = [UIColor blackColor];
    self.button.center = self.center;
}

- (void)cameraClicked {
    [self.escNotifier mainViewCameraButtonClicked];
}


@end
