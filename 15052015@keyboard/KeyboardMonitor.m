//
//  KeyboardMonitor.m
//  15052015@keyboard
//
//  Created by Henry on 15-5-15.
//  Copyright (c) 2015年 unbirdlikebird. All rights reserved.
//

#import "KeyboardMonitor.h"

static KeyboardMonitor *keyboard;

@interface KeyboardMonitor()

@property UIView *superView;
@property CGRect frameOfSuperView;

@end

@implementation KeyboardMonitor

+ (KeyboardMonitor *)keyboard
{
    if (!keyboard) {
        keyboard = [[KeyboardMonitor alloc]init];
    }
    return keyboard;
}

- (void)keyboardWillShowInView:(UIView *)view andNotification:(NSNotification *)notification
{
    _superView = view;
    _frameOfSuperView = view.frame;

    NSDictionary *userInfo = [notification userInfo];
    NSLog(@"[notification userInfo] is %@", [notification userInfo]);

    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSLog(@"objectForKey:UIKeyboardFrameEndUserInfoKey] is %@", aValue);

    CGRect keyboardRect = [aValue CGRectValue];

    for (UIView *subview in view.subviews) {
        if ([subview isFirstResponder]) {
            CGFloat yOfSubview = subview.frame.origin.y + subview.frame.size.height;
            if (yOfSubview > keyboardRect.origin.y) {
                [UIView animateWithDuration:0.25 animations:^{
                    view.frame = CGRectMake(0,
                                            -(keyboardRect.size.height),
                                            view.frame.size.width,
                                            view.frame.size.height + keyboardRect.size.height);
                }];
            }
        }
    }


}


- (void)keyboardWillShowInView:(UIView *)view
{
    [UIView animateWithDuration:0.25 animations:^{
        view.frame = _frameOfSuperView;
    }];
}




@end
