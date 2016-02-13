//
//  SecondViewController.m
//  TopMarkets
//
//  Created by Kevin Perez on 10/6/15.
//  Copyright (c) 2015 Kevin Perez. All rights reserved.
//

#import "CurrentValues.h"

@interface CurrentValues ()

@end

@implementation CurrentValues
@synthesize pickCompanyView;
@synthesize pickerData;

- (IBAction)buttonAction:(UIButton *)sender
{
	NSLog(@"button pressed: %@", [sender currentTitle]);
	self.dataSource = [sender currentTitle];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.pickCompanyView.backgroundColor = [UIColor whiteColor];

	NSArray *data = [[NSArray alloc] initWithObjects:@"DOW" , @"NASDAQ", @"NYSE", @"GOOG", nil];
	self.pickerData = data;
	self.pickCompanyView.dataSource = self;
	self.pickCompanyView.delegate = self;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

//Delegate Method
//the delegate method gives us a way to retrieve the selected item from the picker view.
/*
	Note that the data source and delegate methods can be called any number of 
	times because
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [pickerData objectAtIndex:row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)num
{
	return [pickerData count];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	NSURL * baseUrl = [NSURL URLWithString:@"http://finance.yahoo.com/q?s="];
	if([self.dataSource isEqualToString:@"Google"])
	{
		baseUrl = [NSURL URLWithString:@"https://www.google.com/finance?q="];
	}

	if([[pickerData objectAtIndex:row] isEqualToString:@"NASDAQ"])
	{
		NSString * temp = [[baseUrl absoluteString] stringByAppendingString:@"^IXIC"];
		NSURL *url = [NSURL URLWithString:[temp stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		self.webView.scalesPageToFit = YES;
		[self.webView loadRequest:request];
	}
	else if([[pickerData objectAtIndex:row] isEqualToString:@"DOW"])
	{
		NSString * temp = [[baseUrl absoluteString] stringByAppendingString:@"%5EDJI"];
		NSURL *url = [NSURL URLWithString:[temp stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		self.webView.scalesPageToFit = YES;
		[self.webView loadRequest:request];
	}
	else if([[pickerData objectAtIndex:row] isEqualToString:@"NYSE"])
	{
		NSString * temp = [[baseUrl absoluteString] stringByAppendingString:@"^NYA"];
		NSURL *url = [NSURL URLWithString:[temp stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		self.webView.scalesPageToFit = YES;
		[self.webView loadRequest:request];
	}
	else if([[pickerData objectAtIndex:row] isEqualToString:@"GOOG"])
	{
		NSString * temp = [[baseUrl absoluteString] stringByAppendingString:@"GOOG"];
		NSURL *url = [NSURL URLWithString:[temp stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		self.webView.scalesPageToFit = YES;
		[self.webView loadRequest:request];
	}
	
}



@end
