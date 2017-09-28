//
//  RDPopup.h
//  RDPopupExample
//
//  Created by Webdior Mac - 2 on 27/09/17.
//  Copyright © 2017 Raj Dhakate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDPopupProtocol.h"

@interface RDPopup : UIView

@property (nonatomic, strong) id <RDPopupProtocol> delegate;

/*
 # Animations For Presenting Popup
# Default value FlyInAnimationDefault
 */
typedef enum {
    FlyInAnimationDefault,
    FlyInAnimationDirectionTop,
    FlyInAnimationDirectionBottom,
    FlyInAnimationDirectionLeft,
    FlyInAnimationDirectionRight
} FlyInAnimationDirection;

/*
 # Animations For Dismissing Popup
 # Default value FlyOutAnimationDefault
 */
typedef enum {
    FlyOutAnimationDefault,
    FlyOutAnimationDirectionTop,
    FlyOutAnimationDirectionBottom,
    FlyOutAnimationDirectionLeft,
    FlyOutAnimationDirectionRight
} FlyOutAnimationDirection;

/*
 # IMPORTANT : Presenting View (superview on which popup is presented)
 */
- (instancetype)initOnView:(UIView*)view;

/*
 # Hide Show Methods
 */
- (void) showPopup;
- (void) hidePopup;

//
// Customizations For Popup View.
//

/*
 # Animation Duration . Default value 0.3
 */
@property (assign, nonatomic) float animationDuration;

/*
 # Presenting animation type
 */
@property (assign, nonatomic) FlyInAnimationDirection inAnimation;

/*
 # Dismissing animation type
 */
@property (assign, nonatomic) FlyOutAnimationDirection outAnimation;

/*
 # Background Dim enable . Default value NO
 */
@property (assign, nonatomic) BOOL blurBackground;

/*
 # Dismiss on Background Touch . Default value NO
 */
@property (assign, nonatomic) BOOL dismissOnBackgroundTap;

/*
 # Background Dim Alpha . Default value 0.3
 */
@property (assign, nonatomic) float dimBackgroundLevel;

/*
 # Margins for the view. Currently NOT supporting Autolayout.
 # Top Default value 250
 # Bottom Default value 250
 # Left Default value 250
 # Right Default value 250
 */
@property (assign, nonatomic) float topMargin;
@property (assign, nonatomic) float bottomMargin;
@property (assign, nonatomic) float leftMargin;
@property (assign, nonatomic) float rightMargin;

/*
 # Title for Popup View. Default value @"Hi!"
 */
@property (strong, nonatomic) NSString *title;

/*
 # Message for Popup View. Default value @"Hello World!"
 */
@property (strong, nonatomic) NSString *message;

/*
 # Cancel button title for Popup View. Default value @"Cancel"
 */
@property (strong, nonatomic) NSString *cancelButtonTitle;

/*
 # Other button title for Popup View. Default value @"Done"
 */
@property (strong, nonatomic) NSString *otherButtonTitle;

/*
 # Buttons Radius . Default value 10
 */
@property (assign, nonatomic) float buttonRadius;

/*
 # Corner radius for Popup view. Default value 10
 */
@property (assign, nonatomic) float cornerRadius;

/*
 # Icon image name for Popup View. Default value @"icon"
 */
@property (strong, nonatomic) NSString *iconName;

/*
 # Image name for Popup View. Default value @"icon"
 */
@property (strong, nonatomic) NSString *imgName;

@end
