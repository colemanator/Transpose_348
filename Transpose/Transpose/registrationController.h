//
//  registrationController.h
//  Transpose
//
//  Created by Peter Coleman on 29/10/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registrationController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *txtPassword;



- (IBAction)backgroundTap:(id)sender;



- (IBAction)registerUser:(id)sender;

@end
