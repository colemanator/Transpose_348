//
//  journeyViewControl.h
//  Transpose
//
//  Created by Alexander McNeill on 1/09/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface journeyViewControl : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>


@property (strong, nonatomic) IBOutlet UIDatePicker *selectedTime;
@property (weak, nonatomic) IBOutlet UIPickerView *timeTypePicker;
@property (strong, nonatomic) IBOutlet UITextField *startLoaction;
@property (strong, nonatomic) IBOutlet UITextField *endLocation;
@property (strong, nonatomic) NSMutableArray * searchData;
@property (strong, nonatomic) IBOutlet UISwitch *bus;
@property (strong, nonatomic) IBOutlet UISwitch *train;
@property (strong, nonatomic) IBOutlet UISwitch *ferry;
@property (strong, nonatomic) IBOutlet UISwitch *tram;
- (IBAction)backgroundTap:(id)sender;

@end
