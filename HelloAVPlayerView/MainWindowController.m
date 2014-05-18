//
//  MainWindowController.m
//  HelloAVPlayerView
//
//  Created by Bear on 2014/5/18.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "MainWindowController.h"
#import "DraggedAVPlayerView.h"

// 使用 AVPlayer 與 AVPlayerItem 必要載入的標頭檔
#import <AVFoundation/AVFoundation.h>

@interface MainWindowController ()

@property (weak) IBOutlet DraggedAVPlayerView *avPlayerView;

@end


@implementation MainWindowController

/*
 * 更換播放的影片檔
 * AVPlayerView 主要是將影片呈現在螢幕上
 * 播放影片的動作實際上是由 AVPlayer 負責
 */
- (void)changeContentURL:(NSURL *)fileURL
{
    // 還沒有初始化過 AVPlayer
    if (_avPlayerView.player == nil) {
        AVPlayer *player = [AVPlayer playerWithURL:fileURL];
        self.avPlayerView.player = player;
    }
    // 已經初始化過 AVPlayer
    // 只要更換 AVPlayerItem 就好
    else {
        [self.avPlayerView.player pause];
        
        AVPlayerItem *playItem = [AVPlayerItem playerItemWithURL:fileURL];
        [self.avPlayerView.player replaceCurrentItemWithPlayerItem:playItem];
    }
    
    // 將標題改成影片檔名
    self.window.title = [fileURL lastPathComponent];
}

#pragma mark Drag and Drop
/*
 * 初始化時將自身設定成 DraggedAVPlayerView 的 delegate
 */
- (void)windowDidLoad
{
    [super windowDidLoad];
    
    self.avPlayerView.delegate = self;
}

/*
 * 實作 DraggedAVPlayerViewDelagate protocol
 * 載入影片檔
 */
- (BOOL)dragFileURL:(NSURL *)fileURL
{
    [self changeContentURL:fileURL];
    [self.avPlayerView.player play];
    
    return YES;
}

@end
