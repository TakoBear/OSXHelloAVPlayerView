//
//  bearAppDelegate.m
//  HelloAVPlayerView
//
//  Created by Bear on 2014/5/18.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "bearAppDelegate.h"
#import "MainWindowController.h"

@implementation bearAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self.mainWindowController showWindow:self];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

- (MainWindowController *)mainWindowController
{
    if (_mainWindowController == nil) {
        _mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindowController"];
    }
    return _mainWindowController;
}

@end

