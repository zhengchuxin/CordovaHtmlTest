//
//  MyPlugin.m
//  WKWebiveCordova
//
//  Created by apple on 2020/7/6.
//  Copyright © 2020 apple. All rights reserved.
//

#import "MyPlugin.h"

@implementation MyPlugin

//获取当前位置信息
- (void)currentPosition:(CDVInvokedUrlCommand *)command {
    NSLog(@"command是回调的参数，在里面取");
    CDVPluginResult *result2 = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsArray:@[ @"data1", @"data2" ]];
    [self.commandDelegate sendPluginResult:result2 callbackId:command.callbackId];
}
@end
