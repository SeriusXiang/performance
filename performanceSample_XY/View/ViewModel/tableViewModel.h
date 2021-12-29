//
//  tableViewModel.h
//  performanceSample_XY
//
//  Created by fotor on 2021/12/29.
//

#import <Foundation/Foundation.h>
#import "tableShowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface tableViewModel : NSObject

@property (nonatomic, strong) NSArray <tableShowModel *>*models;

@end

NS_ASSUME_NONNULL_END
