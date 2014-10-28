//
//  loginViewControl.h
//  Transpose
//
//  Created by Alexander McNeill on 1/09/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewControl : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginEmail;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;

- (IBAction)doneLoginClicked:(id)sender;
- (IBAction)backgroundTap:(id)sender;
@end
