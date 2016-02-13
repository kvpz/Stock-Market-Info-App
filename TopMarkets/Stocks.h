//
//  Stocks.h
//  TopMarkets
//
//  Created by Kevin Perez on 10/6/15.
//  Copyright (c) 2015 Kevin Perez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stocks : NSObject

// Company name
@property(nonatomic, strong) NSString *name;
// Company stock current value
@property(nonatomic, weak) NSNumber *currentValue;
// Company logo image
@property(nonatomic, strong) NSString *imageFile;
// information about the company
@property(nonatomic, strong) NSString *info;

@end
