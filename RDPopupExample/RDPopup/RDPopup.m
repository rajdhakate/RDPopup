//
//  RDPopup.m
//  RDPopupExample
//
//  Created by Webdior Mac - 2 on 27/09/17.
//  Copyright © 2017 Raj Dhakate. All rights reserved.
//

#import "RDPopup.h"
#import "CustomPopup.h"

#define WIN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define WIN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define DefaultAnimationDuration 0.3
#define DefaultInAnimation 0
#define DefaultOutAnimation 0
#define DefaultTitle @"Hi!"
#define DefaultMessage @"Hello World!"
#define DefaultCancelTitle @"Cancel"
#define DefaultOtherTitle @"Done"
#define DefaultIcon @"icon"
#define DefaultImage @"image"
#define DefaultTopMargin 100
#define DefaultBottomMargin 100
#define DefaultLeftMargin 15
#define DefaultRightMargin 15
#define DefaultDimmedLevel 0.3
#define DefaultCornerRadius 10
#define DefaultButtonRadius 10

@interface RDPopup()

@property (strong, nonatomic) CustomPopup *customView;
@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) UIView *dimBG;
@property (strong, nonatomic) UIVisualEffectView *blurBG;

@end

@implementation RDPopup

#pragma mark - Initialization Methods
- (instancetype)initOnView:(UIView*)view {
    self.view = view;
    return self;
}

- (void) initialize {
    if (!self.inAnimation) {
        self.inAnimation = DefaultInAnimation;
    }
    if (!self.outAnimation) {
        self.outAnimation = DefaultOutAnimation;
    }
    if (!self.topMargin) {
        self.topMargin = DefaultTopMargin;
    }
    if (!self.bottomMargin) {
        self.bottomMargin = DefaultBottomMargin;
    }
    if (!self.leftMargin) {
        self.leftMargin = DefaultLeftMargin;
    }
    if (!self.rightMargin) {
        self.rightMargin = DefaultRightMargin;
    }
    if (!self.cornerRadius) {
        self.cornerRadius = DefaultCornerRadius;
    }
    if (!self.buttonRadius) {
        self.buttonRadius = DefaultButtonRadius;
    }
    if (!self.animationDuration) {
        self.animationDuration = DefaultAnimationDuration;
    }
    if (!self.dimBackgroundLevel) {
        self.dimBackgroundLevel = DefaultDimmedLevel;
    }
    if (!self.title) {
        self.title = DefaultTitle;
    }
    if (!self.message) {
        self.message = DefaultMessage;
    }
    if (!self.otherButtonTitle) {
        self.otherButtonTitle = DefaultOtherTitle;
    }
    if (!self.cancelButtonTitle) {
        self.cancelButtonTitle = DefaultCancelTitle;
    }
    if (!self.iconName) {
        self.iconName = DefaultIcon;
    }
    if (!self.imgName) {
        self.imgName = DefaultImage;
    }
}

#pragma mark - Popup Build
- (void) setPopup {
    [self initialize];
    self.customView = [[[NSBundle mainBundle] loadNibNamed:@"CustomPopup" owner:nil options:nil] firstObject];
    self.customView.frame = CGRectMake(0, 0, self.view.bounds.size.width-(self.leftMargin+self.rightMargin), self.view.bounds.size.height-(self.topMargin+self.bottomMargin));
    self.customView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.customView.center = self.view.center;
    self.customView.layer.cornerRadius = self.cornerRadius;
    [self setBlurredBackground];
    [self setupLabels];
    [self setupButtons];
    [self setupImages];
}

#pragma mark - Blur Background
- (void) setBlurredBackground {
    if (!UIAccessibilityIsReduceTransparencyEnabled() && self.blurBackground) {
        UIBlurEffect *burrEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        self.blurBG = [[UIVisualEffectView alloc] initWithEffect:burrEffect];
        self.blurBG.frame = self.view.bounds;
        self.blurBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        if (self.dismissOnBackgroundTap) {
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidePopup)];
            tapGesture.numberOfTapsRequired = 1;
            [self.blurBG addGestureRecognizer:tapGesture];
        }
        [self.view addSubview:self.blurBG];
    } else {
        [self setDimBackground];
    }
}

#pragma mark - Dim Background
- (void) setDimBackground {
    self.dimBG = [[UIView alloc]initWithFrame:self.view.bounds];
    self.dimBG.alpha = self.dimBackgroundLevel;
    self.dimBG.backgroundColor = [UIColor blackColor];
    self.dimBG.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if (self.dismissOnBackgroundTap) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidePopup)];
        tapGesture.numberOfTapsRequired = 1;
        [self.dimBG addGestureRecognizer:tapGesture];
    }
    [self.view addSubview:self.dimBG];
}

#pragma mark - Setup Labels
- (void) setupLabels {
    self.customView.titleLabel.text = self.title;
    self.customView.messageLabel.text = self.message;
}

#pragma mark - Setup Buttons
- (void) setupButtons {
    [self.customView.cancelButton setTitle:self.cancelButtonTitle forState:UIControlStateNormal];
    [self.customView.otherButton setTitle:self.otherButtonTitle forState:UIControlStateNormal];
    
    self.customView.otherButton.layer.cornerRadius = self.buttonRadius;
    self.customView.cancelButton.layer.cornerRadius = self.buttonRadius;
    
    [self.customView.otherButton addTarget:self action:@selector(otherButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.customView.cancelButton addTarget:self action:@selector(cancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Setup Images
- (void) setupImages {
    self.customView.iconView.image = [UIImage imageNamed:self.iconName];
    self.customView.imgView.image = [UIImage imageNamed:self.imgName];
}

#pragma mark - Actions
- (void) otherButtonAction {
    [_delegate otherButtonAction:self.customView button:self.customView.otherButton];
}

- (void) cancelButtonAction {
    [_delegate cancelButtonAction:self.customView button:self.customView.cancelButton];
}

#pragma mark - Hide/Show Methods
- (void) showPopup {
    [self setPopup];
    [self animateIn];
}

- (void) hidePopup {
    [self animateOut];
}

#pragma mark - Animations
- (void) animateIn {
    switch (self.inAnimation) {
        case 1:
        {
            self.customView.frame = CGRectOffset(self.customView.frame, 0, -self.view.center.y);
            [self.view addSubview:self.customView];
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.frame = CGRectOffset(self.customView.frame, 0, self.view.center.y);
            }];
        }
            break;
        case 2:
        {
            self.customView.frame = CGRectOffset(self.customView.frame, 0, WIN_HEIGHT+self.view.center.y);
            [self.view addSubview:self.customView];
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.frame = CGRectOffset(self.customView.frame, 0, -WIN_HEIGHT-self.view.center.y);
            }];
        }
            break;
        case 3:
        {
            self.customView.frame = CGRectOffset(self.customView.frame, -self.view.center.x, 0);
            [self.view addSubview:self.customView];
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.frame = CGRectOffset(self.customView.frame, self.view.center.x, 0);
            }];
        }
            break;
        case 4:
        {
            self.customView.frame = CGRectOffset(self.customView.frame, WIN_WIDTH+self.view.center.x, 0);
            [self.view addSubview:self.customView];
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.frame = CGRectOffset(self.customView.frame, -WIN_WIDTH-self.view.center.x, 0);
            }];
        }
            break;
        default:
        {
            self.customView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            [self.view addSubview:self.customView];
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.transform = CGAffineTransformIdentity;
            }];
        }
            break;
    }
}

- (void) animateOut {
    switch (self.outAnimation) {
        case 1:
        {
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.frame = CGRectOffset(self.customView.frame, 0, -self.view.center.y);
                [self.view layoutIfNeeded];
                self.customView.alpha = 0;
                self.dimBG.alpha = 0;
                self.blurBG.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromView];
            }];
        }
            break;
        case 2:
        {
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.frame = CGRectOffset(self.customView.frame, 0, WIN_HEIGHT+self.view.center.y);
                [self.view layoutIfNeeded];
                self.customView.alpha = 0;
                self.dimBG.alpha = 0;
                self.blurBG.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromView];
            }];
        }
            break;
        case 3:
        {
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.frame = CGRectOffset(self.customView.frame, -WIN_WIDTH-self.view.center.x, 0);
                [self.view layoutIfNeeded];
                self.customView.alpha = 0;
                self.dimBG.alpha = 0;
                self.blurBG.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromView];
            }];
        }
            break;
        case 4:
        {
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.frame = CGRectOffset(self.customView.frame, WIN_WIDTH+self.view.center.x, 0);
                [self.view layoutIfNeeded];
                self.customView.alpha = 0;
                self.dimBG.alpha = 0;
                self.blurBG.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromView];
            }];
        }
            break;
        default:
        {
            [UIView animateWithDuration:self.animationDuration animations:^{
                self.customView.transform = CGAffineTransformMakeScale(1.5, 1.5);
                [self.view layoutIfNeeded];
                self.customView.alpha = 0;
                self.dimBG.alpha = 0;
                self.blurBG.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromView];
            }];
        }
            break;
    }
}

- (void) removeFromView {
    [self.customView removeFromSuperview];
    [self.dimBG removeFromSuperview];
    [self.blurBG removeFromSuperview];
    
    [self cleanCode];
}

#pragma mark - Cleaning
- (void) cleanCode {
    self.customView = nil;
    self.dimBG = nil;
    self.blurBG = nil;
}

@end
