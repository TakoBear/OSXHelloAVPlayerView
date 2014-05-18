//
//  DraggedAVPlayerView.m
//  HelloAVPlayerView
//
//  Created by Bear on 2014/5/18.
//  Copyright (c) 2014年 TakoBear. All rights reserved.
//

#import "DraggedAVPlayerView.h"

@implementation DraggedAVPlayerView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // 註冊可以接受拖曳的資料形態
        // NSURLPboardType 是單一檔案的 URL
        // 可以從剪貼簿中取得一個 NSURL 物件
        [self registerForDraggedTypes:[NSArray arrayWithObjects:NSURLPboardType, nil]];
    }
    return self;
}

/*
 * 允許拖曳進視圖的動作
 */
- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
    NSPasteboard *pboard;
    NSDragOperation sourceDragMask;
    
    sourceDragMask = [sender draggingSourceOperationMask];
    pboard = [sender draggingPasteboard];
    
    // 拖曳進視圖的資料，都會先放進剪貼簿中
    // 所以在使用之前，需要先確認剪貼簿的資料形態
    if ([[pboard types] containsObject:NSURLPboardType]) {
        if (sourceDragMask & NSDragOperationLink) {
            return NSDragOperationLink;
        }
    }
    
    // 拖曳的資料無法使用，直接結束拖曳的動作
    return NSDragOperationNone;
}

/*
 * 拖曳進視圖區域後放開，執行動作
 */
- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
    
    NSPasteboard *pboard;
    NSDragOperation sourceDragMask;
    
    sourceDragMask = [sender draggingSourceOperationMask];
    pboard = [sender draggingPasteboard];
    
    // 拖曳進視圖的資料，都會先放進剪貼簿中
    // 所以在使用之前，需要先確認剪貼簿的資料形態
    // 從剪貼簿中取得 NSURL 物件，交給 delegate 執行接下來的動作
    if ([[pboard types] containsObject:NSURLPboardType]) {
        NSURL *fileURL = [NSURL URLFromPasteboard:pboard];
        
        if (sourceDragMask & NSDragOperationLink) {
            return [self.delegate dragFileURL:fileURL];
        }
    }
    return YES;
}

@end
