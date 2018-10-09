//
//  HQRouteHandler.h
//  asdasd
//
//  Created by 陆久银 on 2018/10/9.
//  Copyright © 2018 lujiuyin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef id HQParameters;

typedef void(^HQCompleteHandler)(id result, NSError *error);

@protocol HQRouteHandler <NSObject>

+ (NSString *)routePath;
+ (void)handlerRequestWithParameters:(HQParameters)parameters topViewController:(UIViewController *)topViewController completeHandler:(HQCompleteHandler)completeHandler;
@end

NS_ASSUME_NONNULL_END
