//
//  StockDetailsIndividual.m
//  TopMarkets
//
//  Created by Kevin Perez on 10/7/15.
//  Copyright (c) 2015 Kevin Perez. All rights reserved.
//

#import "CompanyDetails.h"

@interface CompanyDetails ()

@end

@implementation CompanyDetails

-(void)viewDidLoad
{
	NSLog(@"Company Details loaded");
	[super viewDidLoad];
	[self.Logo setImage:[UIImage imageNamed:self.stock.imageFile]];
	[self.Description setText:self.stock.info];
	if([self.stock.name isEqualToString:@"DOW Jones"])
	{
		self.companyFullName.text = @"The Dow Chemical Company";
	}
	else if([self.stock.name isEqualToString:@"NASDAQ"])
	{
		self.companyFullName.text = @"National Association of Securities Dealers Automated Quotations";
	}
	else if([self.stock.name isEqualToString:@"NYSE"])
	{
		self.companyFullName.text = @"New York Stock Exchange";
	}
}

-(void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}


@end
