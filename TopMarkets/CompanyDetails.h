//
//  StockDetailsIndividual.h
//  TopMarkets
//
//  Created by Kevin Perez on 10/7/15.
//  Copyright (c) 2015 Kevin Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stocks.h"

@interface CompanyDetails : UIViewController

@property (strong, atomic) Stocks *stock;
@property (weak, nonatomic) IBOutlet UIImageView *Logo;
@property (weak, nonatomic) IBOutlet UITextView *Description;
@property (strong, nonatomic) IBOutlet UILabel *companyFullName;

@end
