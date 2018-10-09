//
//  HQRoute.m
//  asdasd
//
//  Created by 陆久银 on 2018/10/9.
//  Copyright © 2018 lujiuyin. All rights reserved.
//

#import "HQRoute.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

static UIViewController *_hq_get_top_view_controller() {
    UIViewController *vc = UIApplication.sharedApplication.keyWindow.rootViewController;
    while ([vc isKindOfClass:[UINavigationController class]] || [vc isKindOfClass:[UITabBarController class]]) {
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = [(UINavigationController *)vc topViewController];
        }
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = [(UITabBarController *)vc selectedViewController];
        }
        if (vc.presentedViewController ) {
            vc = vc.presentedViewController;
        }
    }
    return vc;
}
@interface HQRoute ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, Class<HQRouteHandler>> *handlersM;
@end
@implementation HQRoute

- (instancetype)init {
    self = [super init];
    if ( !self ) return nil;
    _handlersM = [NSMutableDictionary new];
    
    unsigned int cls_count = 0;
    NSString *app_img = [NSBundle mainBundle].executablePath;
    const char **classes = objc_copyClassNamesForImage([app_img UTF8String], &cls_count);
    Protocol *p_handler = @protocol(HQRouteHandler);
    for ( unsigned int i = 0 ; i < cls_count ; ++ i ) {
        const char *cls_name = classes[i];
        NSString *cls_str = [NSString stringWithUTF8String:cls_name];
        Class cls = NSClassFromString(cls_str);
        if ( ![cls conformsToProtocol:p_handler] ) continue;
        if ( ![(id)cls respondsToSelector:@selector(routePath)] ) continue;
        if ( ![(id)cls respondsToSelector:@selector(handlerRequestWithParameters:topViewController:completeHandler:)] ) continue;
        _handlersM[[(id<HQRouteHandler>)cls routePath]] = cls;
    }
    if ( classes ) free(classes);
    return self;
}
+ (instancetype)sharedInstance {
    static HQRoute *route;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        route = [[HQRoute alloc] init];
    });
    return route;
}

- (void)handlerRequest:(HQRouteRequest *)request completeHandler:(nonnull HQCompleteHandler)completeHandler {
    Class<HQRouteHandler> cls = _handlersM[request.requestPath];
    if (cls) {
        [cls handlerRequestWithParameters:request.parameters topViewController:_hq_get_top_view_controller() completeHandler:completeHandler];
    }
}


@end
