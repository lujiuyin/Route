//
//  SecondViewController.m
//  asdasd
//
//  Created by 陆久银 on 2018/10/9.
//  Copyright © 2018 lujiuyin. All rights reserved.
//

#import "SecondViewController.h"
#import "HQRoute.h"

@interface SecondViewController ()<HQRouteHandler>
@property (nonatomic, strong) UILabel *idlab;
@property (nonatomic, strong) id prm;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SecondViewController";
    
    self.view.backgroundColor = [UIColor yellowColor];
    _idlab = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_idlab];
}

+ (void)handlerRequestWithParameters:(nonnull HQParameters)parameters topViewController:(nonnull UIViewController *)topViewController completeHandler:(nonnull HQCompleteHandler)completeHandler {
    SecondViewController *vc = [SecondViewController new];
    [topViewController.navigationController pushViewController:vc animated:YES];
}

+ (nonnull NSString *)routePath {
    return @"second/play/backInfo";
}

- (void)setPrm:(id)prm {
    self.idlab.text = [NSString stringWithFormat:@"%@",[prm objectForKey:@"second_id"]];
    _prm = prm;
}

@end
