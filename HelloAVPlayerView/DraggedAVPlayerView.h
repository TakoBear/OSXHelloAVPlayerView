//
//  DraggedAVPlayerView.h
//  HelloAVPlayerView
//
//  Created by Bear on 2014/5/18.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVKit/AVKit.h>

@class DraggedAVPlayerView;

@protocol DraggedAVPlayerViewDelagate<NSObject>

@optional
- (BOOL)dragFileURL:(NSURL *)fileURL;

@end

@interface DraggedAVPlayerView : AVPlayerView

@property (nonatomic) id <DraggedAVPlayerViewDelagate> delegate;

@end
