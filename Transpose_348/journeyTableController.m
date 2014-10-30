//
//  journeyTableController.m
//  Transpose
//
//  Created by Peter Coleman on 29/10/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import "journeyTableController.h"
#import "journeyViewControl.h"

@implementation journeyTableController

journeyViewControl *journeySearch;

NSArray *journeies;

-(void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"seenWelcome"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    journeies = [[NSArray alloc] initWithObjects:@"Central station to caboolture station",@"Southbank station to caboolture station", nil];
    journeySearch = [[journeyViewControl alloc]init];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma journey results cell properties

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [journeies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [journeies objectAtIndex:indexPath.row];
    return cell;}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    
    //Build a segue string based on the selected cell
    NSString *segueString = @"journeyDetails";
    //Since contentArray is an array of strings, we can use it to build a unique
    //identifier for each segue.
    
    //Perform a segue.
    [self performSegueWithIdentifier:segueString
                              sender:[journeies objectAtIndex:indexPath.row]];
}


@end

