//
//  CustomPopup.h
//  RDPopupExample
//
//  Created by Webdior Mac - 2 on 27/09/17.
//  Copyright © 2017 Raj Dhakate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPopup : UIView

@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;
@property (strong, nonatomic) IBOutlet UIButton *otherButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;

@end
