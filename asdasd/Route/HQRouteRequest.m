//
//  HQRouteRequest.m
//  asdasd
//
//  Created by 陆久银 on 2018/10/9.
//  Copyright © 2018 lujiuyin. All rights reserved.
//

#import "HQRouteRequest.h"

@interface HQRouteRequest()


@end

@implementation HQRouteRequest

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}

- (instancetype)initWithRequestPath:(NSString *)requestPath withParameters:(HQParameters)parameters {
    self = [super init];
    if (self) {
        self.requestPath = requestPath;
        self.parameters = parameters;
    }
    return self;
}

@end
