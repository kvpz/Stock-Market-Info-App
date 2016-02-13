//
//  Companies.h
//  TopMarkets
//
//  Created by Kevin Perez on 10/6/15.
//  Copyright (c) 2015 Kevin Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stocks.h"
#import "CompanyDetails.h" // prepareForSegue: needs an instance of this class

@interface Companies : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *companiesTable;

@end

