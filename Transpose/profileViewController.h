//
//  profileViewController.h
//  Transpose
//
//  Created by Tom Horan on 31/10/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profileViewController : UIViewController
- (IBAction)profileInfo:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *displayData;

@property (weak, nonatomic) IBOutlet UILabel *loginEmail;
@property (weak, nonatomic) IBOutlet UILabel *loginPassword;
@property (weak, nonatomic) IBOutlet UILabel *firstName;


@property (weak, nonatomic) IBOutlet UILabel *birthDate;


@end
