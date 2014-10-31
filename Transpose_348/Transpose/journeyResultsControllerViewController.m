//
//  journeyResultsControllerViewController.m
//  Transpose
//
//  Created by Peter Coleman on 29/10/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import "journeyResultsControllerViewController.h"
#import "journeyTableController.h"

@interface journeyResultsControllerViewController ()

@end

@implementation journeyResultsControllerViewController

journeyTableController *tableController;
NSArray *jsonDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tableController = [[journeyTableController alloc]init];
    jsonDetails = tableController.jsonArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
