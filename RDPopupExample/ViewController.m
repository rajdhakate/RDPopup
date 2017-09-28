//
//  ViewController.m
//  RDPopupExample
//
//  Created by Webdior Mac - 2 on 27/09/17.
//  Copyright © 2017 Raj Dhakate. All rights reserved.
//

#import "ViewController.h"
#import "RDPopup.h"

@interface ViewController () <RDPopupProtocol>
{
    RDPopup *popup;
}

@property (strong, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_btn setTitle:@"Show Popup" forState:UIControlStateNormal];
    popup = [[RDPopup alloc]initOnView:self.view];
    popup.delegate = self;
    popup.title = @"New title";
    popup.message = @"New message";
    popup.cancelButtonTitle = @"Cancel";
    popup.otherButtonTitle = @"Done";
    popup.buttonRadius = 10;
    popup.dismissOnBackgroundTap = YES;
}

- (IBAction)buttonAction:(UIButton *)sender {
    [popup showPopup];
}

- (void)otherButtonAction:(CustomPopup *)popupView button:(UIButton *)button {
    popupView.titleLabel.text = @"DONE READING";
    button.backgroundColor = [UIColor blueColor];
}

- (void)cancelButtonAction:(CustomPopup *)popupView button:(UIButton *)button {
    [popup hidePopup];
}

@end
