//
//  tableViewModel.m
//  performanceSample_XY
//
//  Created by fotor on 2021/12/29.
//

#import "tableViewModel.h"

@implementation tableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    NSMutableArray *mArr = [NSMutableArray array];
    for (int index = 0; index < 3; index++) {
        tableShowModel *model = [[tableShowModel alloc] init];
        model.title = [NSString stringWithFormat:@"title%d", index];
        model.index = index;
        [mArr addObject:model];
    }
    self.models = mArr;
}

@end
