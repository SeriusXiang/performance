//
//  ViewController.m
//  performanceSample_XY
//
//  Created by fotor on 2021/12/28.
//

#import "ViewController.h"
#import "tableViewModel.h"
#import "TestCADisplayLinkViewController.h"
#import "BlendViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) tableViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewModel = [[tableViewModel alloc] init];
}


#pragma mark - <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = self.viewModel.models[indexPath.row].title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.viewModel.models[indexPath.row].index) {
        case 0:
        {
            TestCADisplayLinkViewController *VC = [[TestCADisplayLinkViewController alloc] init];
            [self presentViewController:VC animated:YES completion:nil];
        }
            break;
        case 1:
        {
            BlendViewController *VC = [[BlendViewController alloc] init];
            [self presentViewController:VC animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

@end
