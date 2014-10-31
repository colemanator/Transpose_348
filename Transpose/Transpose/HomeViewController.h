//
//  HomeViewController.h
//  Transpose
//
//  Created by Tom Horan on 10/10/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
- (IBAction)logout:(id)sender;

@end
