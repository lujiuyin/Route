//
//  FirstViewController.m
//  asdasd
//
//  Created by 陆久银 on 2018/10/9.
//  Copyright © 2018 lujiuyin. All rights reserved.
//

#import "FirstViewController.h"
#import "HQRoute.h"

@interface FirstViewController ()<HQRouteHandler>
@property (nonatomic, strong) UILabel *idlab;
@property (nonatomic, strong) id prm;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"FirstViewController";
    self.view.backgroundColor = [UIColor redColor];
    _idlab = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_idlab];
    self.idlab.text = [NSString stringWithFormat:@"%@",[_prm objectForKey:@"first_id"]];
}


+ (void)handlerRequestWithParameters:(nonnull HQParameters)parameters topViewController:(nonnull UIViewController *)topViewController completeHandler:(nonnull HQCompleteHandler)completeHandler {
    FirstViewController *vc = [FirstViewController new];
    vc.prm = parameters;
    [topViewController.navigationController pushViewController:vc animated:YES];
}

+ (nonnull NSString *)routePath {
    return @"first/play/backInfo";
}


@end
