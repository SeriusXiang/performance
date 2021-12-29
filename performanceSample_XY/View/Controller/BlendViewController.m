//
//  BlendViewController.m
//  performanceSample_XY
//
//  Created by fotor on 2021/12/29.
//

#import "BlendViewController.h"
#import "FHHFPSIndicator.h"

@interface BlendViewController ()


@end

@implementation BlendViewController

- (void)dealloc
{
//    [[FHHFPSIndicator sharedFPSIndicator] hide];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [[FHHFPSIndicator sharedFPSIndicator] show];
    self.view.backgroundColor = [UIColor brownColor];
}

- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)button1:(UIButton *)sender
{
    for (int i = 0; i < 1000; i++) {
        //test1 透明通道-blending
//        UIView *view = [[UIView alloc] init];
//        view.frame = CGRectMake(100, 200, 200, 200);
//        view.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:.3f];
//        view.opaque = NO;
//        [self.view addSubview:view];
        
        // test2 layer
//        CALayer *layer = [[CALayer alloc] init];
//        layer.frame = CGRectMake(100, 200, 200, 200);
//        layer.backgroundColor = [UIColor grayColor].CGColor;
//        [self.view.layer addSublayer:layer];
    }
}

- (IBAction)button2:(UIButton *)sender
{
    for (int i = 0; i < 1000; i++) {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(100, 200, 200, 200);
        view.backgroundColor = [UIColor grayColor];
        view.opaque = YES;
        [self.view addSubview:view];
    }
}

@end
