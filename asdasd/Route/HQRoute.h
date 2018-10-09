//
//  HQRoute.h
//  asdasd
//
//  Created by 陆久银 on 2018/10/9.
//  Copyright © 2018 lujiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HQRouteRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface HQRoute : NSObject

+ (instancetype)sharedInstance;

- (void)handlerRequest:(HQRouteRequest *)request completeHandler:(HQCompleteHandler)completeHandler;
@end

NS_ASSUME_NONNULL_END
