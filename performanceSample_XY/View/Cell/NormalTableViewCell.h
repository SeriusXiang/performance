//
//  NormalTableViewCell.h
//  performanceSample_XY
//
//  Created by fotor on 2021/12/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class NormalDataCellModel;
@interface NormalTableViewCell : UITableViewCell

@property (nonatomic, strong) NormalDataCellModel *cellModel;

@end

NS_ASSUME_NONNULL_END
