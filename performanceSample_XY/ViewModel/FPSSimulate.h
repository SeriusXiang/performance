//
//  FPSSimulate.h
//  performanceSample_XY
//
//  Created by fotor on 2021/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPSSimulate : NSObject

+ (instancetype)shareSimulate;

- (void)showFPS;
- (void)hideFPS;

@end

NS_ASSUME_NONNULL_END
