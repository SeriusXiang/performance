//
//  tableViewModel.h
//  performanceSample_XY
//
//  Created by fotor on 2021/12/19.
//

#import <Foundation/Foundation.h>
#import "tableShowModel.h"
#import "NormalDataCellModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, tableType)
{
    tableTypeMain,
    tableTypeNormal,
};

@interface tableViewModel : NSObject

@property (nonatomic, assign) tableType type;
@property (nonatomic, strong) NSArray *models;

- (instancetype)initWithType:(tableType)type;

@end

NS_ASSUME_NONNULL_END
