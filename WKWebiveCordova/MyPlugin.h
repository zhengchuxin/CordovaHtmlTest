//
//  MyPlugin.h
//  WKWebiveCordova
//
//  Created by apple on 2020/7/6.
//  Copyright © 2020 apple. All rights reserved.
//

#import "CDVPlugin.h"
#import <Cordova/CDVPlugin.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPlugin : CDVPlugin

// 获取当前位置信息
- (void)currentPosition:(CDVInvokedUrlCommand *)command;

@end

NS_ASSUME_NONNULL_END
