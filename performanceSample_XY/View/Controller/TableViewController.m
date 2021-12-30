//
//  TableViewController.m
//  performanceSample_XY
//
//  Created by fotor on 2021/12/20.
//

#import "TableViewController.h"
#import "NormalTableViewCell.h"
#import "tableViewModel.h"

@interface TableViewController ()

@property (nonatomic, strong) tableViewModel *viewModel;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 200;
    [self.tableView registerClass:[NormalTableViewCell class] forCellReuseIdentifier:@"cellID"];
    
    self.viewModel = [[tableViewModel alloc] initWithType:tableTypeNormal];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    NormalDataCellModel *model = self.viewModel.models[indexPath.row];
    cell.cellModel = model;
    return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NormalDataCellModel *model = self.viewModel.models[indexPath.row];
//    ((NormalTableViewCell *)cell).cellModel = model;
//}


@end
