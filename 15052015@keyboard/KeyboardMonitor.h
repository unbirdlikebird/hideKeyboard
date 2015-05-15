//
//  KeyboardMonitor.h
//  15052015@keyboard
//
//  Created by Henry on 15-5-15.
//  Copyright (c) 2015年 unbirdlikebird. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyboardMonitor : NSObject

+ (KeyboardMonitor *)keyboard;
- (void)keyboardWillShowInView:(UIView *)view andNotification:(NSNotification *)notification;
- (void)keyboardWillShowInView:(UIView *)view;



@end
