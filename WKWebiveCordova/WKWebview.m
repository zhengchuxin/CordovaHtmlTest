//
//  WKWebview.m
//  WKWebiveCordova
//
//  Created by apple on 2020/7/5.
//  Copyright © 2020 apple. All rights reserved.
//

#import "WKWebview.h"

@interface WKWebview ()

@end

@implementation WKWebview

- (instancetype)init {
    self = [super init];
    if (self) {
        self.configFile   = [self configPath];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotification:)
    name:CDVPluginResetNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
    selector:@selector(onNotificationed:)
    name:CDVPageDidLoadNotification object:nil];
     [self setWebViewBackground];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.currentWebView = (WKWebView *)self.webView;
    self.webView.backgroundColor = [UIColor redColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CDVPluginResetNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CDVPageDidLoadNotification object:nil];
}

- (NSString *)configPath {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"config" ofType:@"xml"];
    NSLog(@"path===== %@",  path);
    return path;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)onNotification:(NSNotification *)notification {
    NSLog(@"webview开始加载");
    WKWebView *webview = notification.object;
    if (![[webview.URL absoluteString] containsString:@"www/error.html"]) {
    }
    if ([webview.URL.absoluteString isEqualToString:@"ios:backtotheroot"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//wkwebView
- (void)onNotificationed:(NSNotification *)notification {
    NSLog(@"webview加载完成");
    WKWebView *webview = notification.object;
    //去除长按后出现的文本选取框
    [webview evaluateJavaScript:@"document.documentElement.style.webkitUserSelect='none';" completionHandler:^(id obj, NSError *error){
    }];
    [webview evaluateJavaScript:@"document.title" completionHandler:^(id obj, NSError *error) {
        if ([obj isKindOfClass:[NSString class]]) {
            self.title = (NSString *)obj;
        }
    }];
}

- (void)setWebUrl:(NSString *)webUrl {
    if (!webUrl) {
        return;
    }
    _webUrl = webUrl;
    if (self.currentWebView) {
        NSURL *url     = [NSURL URLWithString:[webUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.currentWebView loadRequest:request];
    }
}

- (void)setWebViewBackground {
    NSLog(@"self.startPage==%@", self.startPage);
    if ([self.startPage containsString:@"hsjob"]) {
        self.view.backgroundColor = [UIColor redColor];
    } else if ([self.startPage containsString:@"hstravel"]) {
        self.view.backgroundColor = [UIColor redColor];
    } else if ([self.startPage containsString:@"movie"]) {
        self.view.backgroundColor                        = [UIColor blackColor];
//       [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent; //白色
    }
}

@end
