//
//  journeyViewControl.m
//  Transpose
//
//  Created by Alexander McNeill on 1/09/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import "journeyViewControl.h"



@implementation journeyViewControl

NSArray *timeTypesArray;
@synthesize startLoaction, endLocation, searchData;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"seenWelcome"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSArray *data = [[NSArray alloc] initWithObjects:@"Leave before",@"Leave After",@"Arive Before",@"Arive After", nil];
    timeTypesArray = data;

}

#pragma mark picker data source methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [timeTypesArray count];
}

#pragma picker deligate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [timeTypesArray objectAtIndex:row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)LocationsNextButton:(id)sender{
    [searchData addObject: startLoaction.text];
    [searchData addObject: endLocation.text];
}



- (IBAction)timeNextButton:(id)sender {
    NSString *timeTypeSelected = [timeTypesArray objectAtIndex:[self.timeTypePicker selectedRowInComponent:0]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    NSString *timeSelected = [dateFormatter stringFromDate:_time];
    
    [searchData addObject: timeTypeSelected];
    [searchData addObject:timeSelected];
    
}

- (IBAction)transportTypeNextButton:(id)sender {
    if(_bus.on){
        [searchData addObject:@"bus"];
    }
    if(_train.on){
        [searchData addObject:@"train"];
    }
    if(_ferry.on){
        [searchData addObject:@"ferry"];
    }
    if(_tram.on){
        [searchData addObject:@"tram"];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
