//
//  Companies.m
//  TopMarkets
//
//  Created by Kevin Perez on 10/6/15.
//  Copyright (c) 2015 Kevin Perez. All rights reserved.
//

#import "Companies.h"

@interface Companies ()

@end

@implementation Companies
{
	NSArray *company;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
	// make background clear
	self.companiesTable.backgroundColor = [UIColor clearColor];
	
	Stocks *DOW = [[Stocks alloc] init];
	DOW.imageFile = @"dow-chemical-company-logo.jpg";
	DOW.name = @"DOW Jones";
	DOW.currentValue = [NSNumber numberWithDouble:10000];
	DOW.info = @"The Dow Chemical Co., commonly referred to as Dow, is an American multinational chemical corporation headquartered in Midland, Michigan, United States. As of 2007, it is the second-largest chemical manufacturer in the world by revenue (after BASF) and as of February 2009, the third-largest chemical company in the world by market capitalization (after BASF and DuPont). It ranked third in the world by chemical production in 2013.	Dow manufactures plastics, chemicals, and agricultural products. With a presence in about 160 countries, it employs about 54,000 people worldwide.[3] The company has seven different major operating segments, with a wide variety of products made by each one.[3] Dow's 2012 sales totaled approximately $57 billion. Dow has been called the \"chemical companies' chemical company\" in that most of its sales are to other industries rather than end-users. Dow sells directly to end-users primarily in the human and animal health and consumer products markets.	Dow is a member of the American Chemistry Council. The company tagline is \"Solutionism.\"";
	
	
	Stocks *NASDAQ = [[Stocks alloc] init];
	NASDAQ.imageFile = @"NASDAQ_Logo.png";
	NASDAQ.name = @"NASDAQ";
	NASDAQ.currentValue = [NSNumber numberWithDouble:9000];
	NASDAQ.info = @"The NASDAQ Stock Market, commonly known as the NASDAQ, is an American/Canadian stock exchange. It is the second-largest exchange in the world by market capitalization, behind only the New York Stock Exchange. The exchange platform is owned by The NASDAQ OMX Group, which also owns the OMX stock market network and several other US stock and options exchanges.";
	
	Stocks *NYSE = [[Stocks alloc] init];
	NYSE.imageFile = @"NYSE-logo.png";
	NYSE.name = @"NYSE";
	NYSE.currentValue = [NSNumber numberWithDouble:8000];
	NYSE.info = @"The New York Stock Exchange (NYSE), sometimes known as the \"Big Board\",[4] is an American stock exchange located at 11 Wall Street, Lower Manhattan, New York City, New York, United States. It is by far the world's largest stock exchange by market capitalization of its listed companies at US$19.69 trillion as of May 2015. The average daily trading value was approximately US$169 billion in 2013.	The NYSE trading floor is located at 11 Wall Street and is composed of 21 rooms used for the facilitation of trading. A fifth trading room, located at 30 Broad Street, was closed in February 2007. The main building and the 11 Wall Street building were designated National Historic Landmarks in 1978.  The NYSE is owned by Intercontinental Exchange, an American holding company it also lists (NYSE: ICE). Previously, it was part of NYSE Euronext (NYX), which was formed by the NYSE's 2007 merger with the fully electronic stock exchange Euronext. NYSE and Euronext now operate as divisions of Intercontinental Exchange.  The NYSE has been the subject of several lawsuits regarding fraud or breach of duty and in 2004 was sued by its former CEO for breach of contract and defamation.";
	
	company = [NSArray arrayWithObjects:DOW,NASDAQ,NYSE,nil];
}

// left as is
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

/*
	This method and the next tableView: method are called only once. In other words,
 it is called when first entering the supporting view. They are called n amount
 of times, n being the amount of rows being implemented which is determined by 
 how many objects are inside the array
*/
-(NSInteger)tableView: (UITableView *) tableView
	numberOfRowsInSection: (NSInteger) rowCount
{
	return [company count];
}

-(UITableViewCell *)tableView:(UITableView *) tableView
				cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CompanyCell"];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"CompanyCell"];
	}
	
	Stocks *stockCompany = [company objectAtIndex:indexPath.row];
	cell.textLabel.text = stockCompany.name;
  cell.imageView.image = [UIImage imageNamed:stockCompany.imageFile];
	
	cell.backgroundColor = [UIColor colorWithWhite:1 alpha: .35];
	UIView *bgColorView = [[UIView alloc] init];
	bgColorView.backgroundColor = [UIColor colorWithWhite:1 alpha: .55];
	[cell setSelectedBackgroundView:bgColorView];
	return cell;
}

//Implement segue method for the storyboard
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"showCompanyDetail"])
	{
		NSIndexPath *indexPath = [self.companiesTable indexPathForSelectedRow];
		CompanyDetails *destViewController = segue.destinationViewController;
		destViewController.stock = [company objectAtIndex:indexPath.row];
	}
}

@end
