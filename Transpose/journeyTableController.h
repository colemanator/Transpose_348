//
//  journeyTableController.h
//  Transpose
//
//  Created by Peter Coleman on 29/10/2014.
//  Copyright (c) 2014 Teamspark Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface journeyTableController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic)NSArray *jsonArray;
@end
