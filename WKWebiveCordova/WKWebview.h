//
//  WKWebview.h
//  WKWebiveCordova
//
//  Created by apple on 2020/7/5.
//  Copyright © 2020 apple. All rights reserved.
//


#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVCommandDelegateImpl.h>
#import <Cordova/CDVCommandQueue.h>


NS_ASSUME_NONNULL_BEGIN

@interface WKWebview : CDVViewController

//设置这个值，加载当前页面
@property (nonatomic, copy) NSString *webUrl;
//当前页面webview
@property (nonatomic, strong) WKWebView *currentWebView;

@end

NS_ASSUME_NONNULL_END
