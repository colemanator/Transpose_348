//
//  profileViewController.m
//  Transpose
//
//  Created by Tom Horan on 31/10/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import "profileViewController.h"

@interface profileViewController ()

@end

@implementation profileViewController
NSData *data;
NSArray *jsonArray;
NSUInteger count;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)profileInfo:(id)sender {
    
    NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@",[self.loginEmail text],[self.loginPassword text]];
    NSLog(@"PostData: %@",post);
    
    NSURL *url=[NSURL URLWithString:@"http://transposeapp.com/scripts/login.php"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //Read the postData's length so we can pass in to the request
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //Now that we have what to POST, we can now create an NSMutbaleURlRequest and include our postData
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[transposeeapp.com]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *response = nil;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"Response ==> %@", responseData);
    //store JSON data into NSDictionary
    
    NSDictionary *jsonData = [NSJSONSerialization
                              JSONObjectWithData:urlData
                              options:NSJSONReadingMutableContainers
                              error:&error];
    //set Json data to variables
    NSString *username = (NSString *) jsonData[@"username"];
    NSDate *birthdate = (NSDate *) jsonData[@"birthdate"];
    
    //call JSON data via Labels
    
    [_firstName setText:[NSString stringWithFormat:@"%@", username]];
    [_birthDate setText:[NSString stringWithFormat:@"%@", birthdate ]];
    
    
}



@end
