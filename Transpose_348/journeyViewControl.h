//
//  journeyViewControl.h
//  Transpose
//
//  Created by Alexander McNeill on 1/09/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface journeyViewControl : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *timeTypePicker;
@property (strong, nonatomic) IBOutlet UITextField *startLoaction;
@property (strong, nonatomic) IBOutlet UITextField *endLocation;
- (IBAction)backgroundTap:(id)sender;
@end
