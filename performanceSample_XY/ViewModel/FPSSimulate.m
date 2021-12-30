//
//  FPSSimulate.m
//  performanceSample_XY
//
//  Created by fotor on 2021/12/20.
//

#import "FPSSimulate.h"
#import <UIKit/UIKit.h>

@interface FPSSimulate ()

@property (nonatomic, strong) CADisplayLink *link;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSTimeInterval lastTime;
@property (nonatomic, strong) UILabel *label;

@end

@implementation FPSSimulate

static FPSSimulate *_simulate = nil;
+ (instancetype)shareSimulate
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _simulate = [[self alloc] init];
    });
    return _simulate;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.count = 0;
        self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayHandle:)];
        self.link.preferredFramesPerSecond = 60;
        self.link.paused = YES;
        
        [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)displayHandle:(CADisplayLink *)link
{
    if (!self.lastTime) {
        self.lastTime = link.timestamp;
        return;
    }
    
    self.count += 1;
    CGFloat time = link.timestamp - self.lastTime;
    if (time < 1) {
        return;
    }
    
    CGFloat FPS = self.count/time;
    if (self.label) {
        self.label.text = [NSString stringWithFormat:@"%.0f FPS", round(FPS)];
    }
    self.count = 0;
    self.lastTime = link.timestamp;
}

- (void)showFPS
{
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50.f, [[UIApplication sharedApplication] keyWindow].safeAreaInsets.top, 100.f, 30.f)];
    self.label.font = [UIFont boldSystemFontOfSize:14.f];
    self.label.textColor = [UIColor whiteColor];
    self.label.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.8f];
    self.label.layer.cornerRadius = 15.f;
    self.label.layer.masksToBounds = YES;
    self.label.textAlignment = NSTextAlignmentCenter;
    
    self.link.paused = NO;
    [[UIApplication sharedApplication].keyWindow addSubview:self.label];
}

- (void)hideFPS
{
    if (self.label) {
        [self.label removeFromSuperview];
    }
    
    self.link.paused = YES;
    
//    [self.link invalidate];
//    self.link = nil;
//    [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

@end
