//
//  welcomeViewControl.m
//  Transpose
//
//  Created by Alexander McNeill on 1/09/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import "welcomeViewControl.h"

@implementation welcomeViewControl

- (IBAction)addNew:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Registration" message:@"Do you want to register now, or later?" delegate:self cancelButtonTitle:@"Later" otherButtonTitles:@"Now", @"Login", nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)index {
    if (index == 0) {
        [self performSegueWithIdentifier:@"segue.push.alert.journey" sender:self];
    }
    else if (index == 1) {
        [self performSegueWithIdentifier:@"segue.push.alert.registration" sender:self];
    }
    else if (index == 2) {
        [self performSegueWithIdentifier:@"segue.push.alert.login" sender:self];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"-2284896@2x.png"]];
    [self.view addSubview:backgroundView];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"seenWelcome"]) {
        [self performSegueWithIdentifier:@"segue.push.alert.journey" sender:self];
    } else {
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end