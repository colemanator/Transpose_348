//
//  journeyResultsControllerViewController.h
//  Transpose
//
//  Created by Peter Coleman on 29/10/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface journeyResultsControllerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *displayTime;
@property (strong, nonatomic) IBOutlet UILabel *displayName;
@property (strong, nonatomic) IBOutlet UILabel *displayFrom;
@property (strong, nonatomic) IBOutlet UILabel *displayTo;

@end
