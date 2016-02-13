//
//  CurrentValues.h
//  TopMarkets
//
//  Created by Kevin Perez on 10/6/15.
//  Copyright (c) 2015 Kevin Perez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentValues : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
	IBOutlet UIPickerView *pickCompanyView;
	// will hold the company names
	NSArray *pickerData;
	
}
@property (nonatomic, retain) UIPickerView *pickCompanyView;
@property (nonatomic, retain) NSArray *pickerData;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
//@property (strong, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) NSString *dataSource;

@end

