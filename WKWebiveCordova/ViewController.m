//
//  ViewController.m
//  WKWebiveCordova
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ViewController.h"
#import "WKWebview.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"参考" style:UIBarButtonItemStylePlain target:self action:@selector(tipAction)];
}

//MARK:deno参考
- (void)tipAction {
    NSLog(@"点击了参考！");
    WKWebview *vc             = [[WKWebview alloc] init];
//    vc.startPage                = @"http://www.baidu.com";
    vc.hidesBottomBarWhenPushed = NO;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
