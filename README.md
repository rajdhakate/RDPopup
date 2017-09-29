# RDPopup
A simple way to add custom Popup. Design on Nib and use as you want. 
Written in Objective-C.

![Demo](https://github.com/rajdhakate/RDPopup/blob/master/demo.gif)


## REQUISITE : Xcode 9 or Later, iOS 9+.

# HOW TO ADD :

1) Clone/Download the master-repo.
2) Import "RDPopup" folder (.m/.h) into your project.
3) Add #import "RDPopup/RDPopup.h"


# HOW TO USE :

1) Create a new view/nib file. Set the class name to "CustomPopup".
2) Set the outlets to your respective views.
3) Add these lines to create a popup

    RDPopup *popup = [[RDPopup alloc]initOnView:self.view];

    popup.delegate = self;
    
4) Implement two delegate methods.
5) To show [popup showPopup];
6) To hide [popup hidePopup];


# Customizations :

Gives you the freedom to design you own popup in nib.

Supported views on popup : 

Title Label, message label, cancel button, other button, icon imageview, imageview.

RDPopup view can be customized by : 


/*
Animation Duration . Default value 0.3
*/

@property (assign, nonatomic) float animationDuration;


/*
Presenting animation type
*/

@property (assign, nonatomic) FlyInAnimationDirection inAnimation;


/*
Dismissing animation type
*/

@property (assign, nonatomic) FlyOutAnimationDirection outAnimation;


/*
Background Dim enable . Default value NO
*/

@property (assign, nonatomic) BOOL blurBackground;


/*
Dismiss on Background Touch . Default value NO
*/

@property (assign, nonatomic) BOOL dismissOnBackgroundTap;


/*
Background Dim Alpha . Default value 0.3
*/

@property (assign, nonatomic) float dimBackgroundLevel;


/*
Title for Popup View. Default value @"Hi!"
*/

@property (strong, nonatomic) NSString *title;


/*
Message for Popup View. Default value @"Hello World!"
*/

@property (strong, nonatomic) NSString *message;


/*
Cancel button title for Popup View. Default value @"Cancel"
*/

@property (strong, nonatomic) NSString *cancelButtonTitle;


/*
Other button title for Popup View. Default value @"Done"
*/

@property (strong, nonatomic) NSString *otherButtonTitle;


/*
Buttons Radius . Default value 10
*/

@property (assign, nonatomic) float buttonRadius;


/*
Corner radius for Popup view. Default value 10
*/

@property (assign, nonatomic) float cornerRadius;


/*
Icon image name for Popup View. Default value @"icon"
*/

@property (strong, nonatomic) NSString *iconName;


/*
 Image name for Popup View. Default value @"icon"
 */

@property (strong, nonatomic) NSString *imgName;


# Support

Please check the example included.

Suggestions/Queries/Feedbacks are welcome.

Feel free to contribute in anyway.


CHEERS!
