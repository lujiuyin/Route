//
//  ViewController.m
//  asdasd
//
//  Created by 陆久银 on 2018/10/8.
//  Copyright © 2018 lujiuyin. All rights reserved.
//

#import "ViewController.h"
#import "HQRoute.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.dataSource = @[@"FirstVC",@"SecondVC",@"ThirdVC"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            HQRouteRequest *request = [[HQRouteRequest alloc] initWithRequestPath:@"first/play/backInfo" withParameters:@{@"first_id": @(111)}];
            [[HQRoute sharedInstance] handlerRequest:request completeHandler:^(id  _Nonnull result, NSError * _Nonnull error) {
                
            }];
        }
            break;
        case 1:
        {
            HQRouteRequest *request = [[HQRouteRequest alloc] initWithRequestPath:@"second/play/backInfo" withParameters:@{@"second_id": @(222)}];
            [[HQRoute sharedInstance] handlerRequest:request completeHandler:^(id  _Nonnull result, NSError * _Nonnull error) {
                
            }];
        }
            break;
        case 2:
        {
            HQRouteRequest *request = [[HQRouteRequest alloc] initWithRequestPath:@"third/play/backInfo" withParameters:@{@"third_id": @(333)}];
            [[HQRoute sharedInstance] handlerRequest:request completeHandler:^(id  _Nonnull result, NSError * _Nonnull error) {
                
            }];
        }
            break;
        default:
            break;
    }
}
@end
