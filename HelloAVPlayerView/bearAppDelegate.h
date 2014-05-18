//
//  bearAppDelegate.h
//  HelloAVPlayerView
//
//  Created by Bear on 2014/5/18.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MainWindowController;

@interface bearAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) MainWindowController *mainWindowController;

@end
