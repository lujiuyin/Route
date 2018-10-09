//
//  HQRouteRequest.h
//  asdasd
//
//  Created by 陆久银 on 2018/10/9.
//  Copyright © 2018 lujiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HQRouteHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface HQRouteRequest : NSObject

@property (nonatomic, strong) NSString *requestPath;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) HQParameters parameters;

- (instancetype)initWithURL:(NSURL *)url;
- (instancetype)initWithRequestPath:(NSString *)requestPath withParameters:(HQParameters)parameters;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
