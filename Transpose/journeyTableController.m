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
@synthesize jsonArray;

journeyViewControl *journeySearch;

NSArray *journeies;
NSData *data;

-(void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"seenWelcome"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    journeies = [[NSArray alloc] initWithObjects:@"Central station to caboolture station",@"Southbank station to caboolture station", nil];
    data = [[NSData alloc] init];

    NSString *str=@"http://transposeapp.com/scripts/results.php";
    NSURL *url=[NSURL URLWithString:str];
    data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    id response=[NSJSONSerialization JSONObjectWithData:data options:
                 NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"Your JSON Object: %@ Or Error is: %@", response, error);
    
    NSError *e = nil;
    jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    
    if (!jsonArray) {
        NSLog(@"Error parsing JSON: %@", e);
    } else {
        for(NSDictionary *item in jsonArray) {
            NSLog(@"Item: %@", item);
        }
    }
    
    NSLog(@"%@",jsonArray);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma journey results cell properties

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [jsonArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSString *displayText = [NSString stringWithFormat:@"%@%ld, %@, Travil time:%@", @"Option:",(long)indexPath.row+1,[[jsonArray objectAtIndex:indexPath.row] objectForKey:(@"boardingtime")],[[jsonArray objectAtIndex:indexPath.row] objectForKey:(@"totaltime")]];
    
    cell.textLabel.text = displayText;
    return cell;}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    
    //Build a segue string based on the selected cell
    NSString *segueString = @"journeyDetails";
    //Since contentArray is an array of strings, we can use it to build a unique
    //identifier for each segue.
    
    //Perform a segue.
    [self performSegueWithIdentifier:segueString
                              sender:[[jsonArray objectAtIndex:indexPath.row] objectForKey:(@"totaltime")]];
}


@end

