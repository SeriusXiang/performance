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
#import "FPSSimulate.h"
#import "TableViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) tableViewModel *viewModel;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[FPSSimulate shareSimulate] hideFPS];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewModel = [[tableViewModel alloc] initWithType:tableTypeMain];
}


#pragma mark - <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableShowModel *model = self.viewModel.models[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = model.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableShowModel *model = self.viewModel.models[indexPath.row];
    switch (model.index) {
        case 0:
        {
            TestCADisplayLinkViewController *VC = [[TestCADisplayLinkViewController alloc] init];
            VC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:VC animated:YES completion:nil];
        }
            break;
        case 1:
        {
            BlendViewController *VC = [[BlendViewController alloc] init];
            VC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:VC animated:YES completion:^{
                [[FPSSimulate shareSimulate] showFPS];
            }];
        }
            break;
        case 2:
        {
            TableViewController *VC = [[TableViewController alloc] init];
            VC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:VC animated:YES completion:^{
                [[FPSSimulate shareSimulate] showFPS];
            }];
        }
            break;
            
        default:
            break;
    }
}

@end
