//
//  BNRMapPoint.m
//  FollowMyPins
//
//  Created by Richard on 7/3/14.
//  Copyright (c) 2014 Team_7. All rights reserved.
//
#import "BNRViewController.h"
#import "BNRMapPoint.h"

@implementation BNRMapPoint

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c
				   title:(NSString *)t
				subtitle:(NSString *)s;
{
	self = [super init];
	if(self) {
		coordinate = c;
		self.title = t;
		self.subtitle = s;
	}
	return self;
}


-(NSString *)title
{
	return [NSDateFormatter localizedStringFromDate:[NSDate date]
								   dateStyle:NSDateFormatterShortStyle
								   timeStyle:NSDateFormatterShortStyle];
}


- (NSString *)description
{
	NSString *descriptionString;




	descriptionString = [[NSString alloc] initWithFormat:@" Long:%g\u00B0,Lat:%g\u00B0",
								   newUserLocation.coordinate.longitude,
								   newUserLocation.coordinate.latitude];

	return descriptionString;
}


@end
