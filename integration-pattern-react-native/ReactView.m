//
//  ReactView.m
//  integration-pattern-react-native
//
//  Created by yuekong on 16/5/13.
//  Copyright © 2016年 com.github.ytqiu. All rights reserved.
//

//#import "ReactView.h"
#import "ReactView.h"
#import <RCTRootView.h>

@implementation ReactView

- (void)awakeFromNib {
    if (self.moduleName.length <= 0) {
        return;
    }
    
    NSURL *jsCodeLocation = nil;
#if DEBUG
    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
#else
    jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:self.moduleName initialProperties:nil launchOptions:nil];
    [self addSubview:rootView];
    rootView.frame = self.bounds;
}

@end
