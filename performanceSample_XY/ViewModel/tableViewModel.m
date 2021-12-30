//
//  tableViewModel.m
//  performanceSample_XY
//
//  Created by fotor on 2021/12/19.
//

#import "tableViewModel.h"

@implementation tableViewModel

- (instancetype)initWithType:(tableType)type
{
    self = [super init];
    if (self) {
        self.type = type;
        [self initData];
    }
    return self;
}

- (void)initData
{
    NSMutableArray *mArr = [NSMutableArray array];
    
    if (self.type == tableTypeMain) {
        for (int index = 0; index < 3; index++) {
            tableShowModel *model = [[tableShowModel alloc] init];
            model.title = [NSString stringWithFormat:@"title%d", index];
            model.index = index;
            [mArr addObject:model];
        }
    }
    else if (self.type == tableTypeNormal) {
        for (int index = 0; index < 1000; index++) {
            NormalDataCellModel *model = [[NormalDataCellModel alloc] init];
            model.title = [NSString stringWithFormat:@"title%d", index];
            model.des = [NSString stringWithFormat:@"des%d", index];
            model.url = @"https://pics3.baidu.com/feed/ac4bd11373f08202911a37a274aba9eaaa641b7e.png?token=a080be2cc92f03396d97d64543d2c98f";
            model.icon = @"sirius";
            [mArr addObject:model];
        }
    }

    self.models = mArr;
}

@end
