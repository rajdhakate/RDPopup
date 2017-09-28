//
//  RDPopupProtocol.h
//  RDPopupExample
//
//  Created by Webdior Mac - 2 on 27/09/17.
//  Copyright © 2017 Raj Dhakate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CustomPopup.h"

@protocol RDPopupProtocol <NSObject>

@required
- (void)otherButtonAction:(CustomPopup*)popupView button:(UIButton*)button;
- (void)cancelButtonAction:(CustomPopup*)popupView button:(UIButton*)button;

@end
