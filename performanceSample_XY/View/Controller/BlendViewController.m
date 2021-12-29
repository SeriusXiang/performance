//
//  BlendViewController.m
//  performanceSample_XY
//
//  Created by fotor on 2021/12/29.
//

#import "BlendViewController.h"

@interface BlendViewController ()

@property (nonatomic, strong) NSArray *viewArr;
@property (nonatomic, strong) NSArray *colors;

@end

@implementation BlendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.colors = @[UIColor.blackColor, UIColor.blueColor, UIColor.yellowColor, UIColor.brownColor];
}

- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)button1:(UIButton *)sender {
    if (self.viewArr.count > 0) {
        [self.viewArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    NSMutableArray *mArr = [NSMutableArray array];
    NSTimeInterval time1 = [[NSDate date] timeIntervalSince1970];
    for (int index = 0; index < 10000; index ++) {
        int x = arc4random()%self.colors.count;
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(100, 100, 100, 100);
        view.backgroundColor = self.colors[x];
        if (index != 0) {
            view.alpha = .1f;
        }
        else {
            view.alpha = 1.f;
        }
        [self.view addSubview:view];
        [mArr addObject:view];
    }
    NSTimeInterval time2 = [[NSDate date] timeIntervalSince1970];
    CGFloat time = time2-time1;
    NSLog(@"耗时 = %.2lf", time);
    self.viewArr = mArr;
}

- (IBAction)button2:(UIButton *)sender {
    if (self.viewArr.count > 0) {
        [self.viewArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    NSMutableArray *mArr = [NSMutableArray array];
    NSTimeInterval time1 = [[NSDate date] timeIntervalSince1970];
    for (int index = 0; index < 10000; index ++) {
        UIView *view = [[UIView alloc] init];
        int x = arc4random()%self.colors.count;
        view.frame = CGRectMake(100, 100, 100, 100);
        view.backgroundColor = self.colors[x];
        [self.view addSubview:view];
        [mArr addObject:view];
    }
    NSTimeInterval time2 = [[NSDate date] timeIntervalSince1970];
    CGFloat time = time2-time1;
    NSLog(@"耗时 = %.2lf", time);
    self.viewArr = mArr;
}

@end
