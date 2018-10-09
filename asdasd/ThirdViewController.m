//
//  ThirdViewController.m
//  asdasd
//
//  Created by 陆久银 on 2018/10/9.
//  Copyright © 2018 lujiuyin. All rights reserved.
//

#import "ThirdViewController.h"
#import "HQRoute.h"

@interface ThirdViewController ()<HQRouteHandler>
@property (nonatomic, strong) UILabel *idlab;
@property (nonatomic, strong) id prm;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ThirdViewController";
    
    self.view.backgroundColor = [UIColor blueColor];
    _idlab = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_idlab];
}

+ (void)handlerRequestWithParameters:(nonnull HQParameters)parameters topViewController:(nonnull UIViewController *)topViewController completeHandler:(nonnull HQCompleteHandler)completeHandler {
    ThirdViewController *vc = [ThirdViewController new];
    [topViewController.navigationController pushViewController:vc animated:YES];
}

+ (nonnull NSString *)routePath {
    return @"third/play/backInfo";
}

- (void)setPrm:(id)prm {
    self.idlab.text = [NSString stringWithFormat:@"%@",[prm objectForKey:@"third_id"]];
    _prm = prm;
}

@end
