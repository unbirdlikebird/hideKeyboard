//
//  ViewController.m
//  15052015@keyboard
//
//  Created by Henry on 15-5-15.
//  Copyright (c) 2015年 unbirdlikebird. All rights reserved.
//

#import "ViewController.h"
#import "KeyboardMonitor.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFiled1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;

@end

@implementation ViewController

- (void)keyboardWillShow:(NSNotification *)aNotification
{
    [[KeyboardMonitor keyboard]keyboardWillShowInView:self.view
                                      andNotification:aNotification];
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    [[KeyboardMonitor keyboard]keyboardWillShowInView:self.view];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
