//
//  TestCADisplayLinkViewController.m
//  performanceSample_XY
//
//  Created by fotor on 2021/12/28.
//

#import "TestCADisplayLinkViewController.h"

@interface TestCADisplayLinkViewController ()

@property (nonatomic, strong) CADisplayLink *link;
@property (weak, nonatomic) IBOutlet UIView *testView1;

@end

@implementation TestCADisplayLinkViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkClick)];
    link.paused = NO;
//    link.preferredFramesPerSecond = 30;
    
    self.link = link;
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)linkClick
{
    NSLog(@"_______duration = %lf", self.link.duration);
    NSLog(@"_______timestamp = %lf", self.link.timestamp);
    NSLog(@"_______targetTimestamp = %lf", self.link.targetTimestamp);
    NSLog(@"_______preferredFramesPerSecond = %ld", self.link.preferredFramesPerSecond);
    NSLog(@"_______FPS = %lf", self.link.targetTimestamp-self.link.timestamp);
    self.testView1.transform = CGAffineTransformRotate(self.testView1.transform, M_PI / 240);
}

- (void)startAnimation
{
//    CFTimeInterval beginTime = CACurrentMediaTime();
    self.link.paused = NO;
}

- (void)stopAnimation
{
    self.link.paused = YES;
    [self.link invalidate];
    self.link = nil;
}

- (IBAction)close:(id)sender {
    [self stopAnimation];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
