//
//  loginViewControl.m
//  Transpose
//
//  Created by Alexander McNeill on 1/09/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import "loginViewControl.h"

@implementation loginViewControl

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


- (IBAction)doneLoginClicked:(id)sender {
    NSInteger success = 0;
    
    
    
    @try {
        //if email and password's do not equal a registered user's email and password, alert user
        if([[self.loginEmail text] isEqualToString:@""] || [[self.loginPassword text] isEqualToString:@""] ) {
            
            [self alertStatus:@"Please check your Email and Password" :@"Sign in unsuccessful" :0];
            
        } else {
           
            //Create the POST's body as a NSstring and convert it to NS data
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
            
            NSLog(@"Response code: %ld", (long)[response statusCode]);
            
            if ([response statusCode] >= 200 && [response statusCode] < 300)
            {
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"Response ==> %@", responseData);
                
                NSError *error = nil;
                NSDictionary *jsonData = [NSJSONSerialization
                                          JSONObjectWithData:urlData
                                          options:NSJSONReadingMutableContainers
                                          error:&error];
                
                success = [jsonData[@"success"] integerValue];
                NSLog(@"Success: %ld",(long)success);
                
                if(success == 1)
                {
                    //create path to file
                    NSError *error;
                    
                    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                    NSString *documentsDirectory = [paths objectAtIndex:0];
                    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
                    
                    NSFileManager *fileManager = [NSFileManager defaultManager];
                    
                    if (![fileManager fileExistsAtPath: path])
                    {
                        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
                        
                        [fileManager copyItemAtPath:bundle toPath:path error:&error];
                    }
                    
                    //write data to file
                    NSLog(@"Login SUCCESS");
                
                    
                    
                    
                    [jsonData writeToFile:path atomically:YES];
                    NSLog(@"Passed write code");
                    
                    
                    
                    
                } else {
                    
                    NSString *error_msg = (NSString *) jsonData[@"error_message"];
                    [self alertStatus:error_msg :@"Log in Failed!" :0];
                }
                
            } else {
                           [self alertStatus:@"Please check your Internet Connection" :@"Log in Failed!" :0];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Sign in Failed." :@"Error!" :0];
    }
    if (success) {
       [self alertStatus:@"Welcome to Transpose" :@"You have Logged in Succesfully!" :0];
        [self performSegueWithIdentifier:@"logSuccess" sender:self];
    }
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
//method for tapping background to get rid of the keyboard
- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
