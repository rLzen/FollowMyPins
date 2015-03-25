//
//  BNRMapPointStorage.m
//  FollowMyPins
//
//  Created by Richard on 7/3/14.
//  Copyright (c) 2014 Team_7. All rights reserved.
//

#import "BNRMapPointStorage.h"
#import "BNRMapPoint.h"

@interface BNRMapPointStorage () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRMapPointStorage

+ (instancetype) sharedStorage
{
	static BNRMapPointStorage *sharedStorage;
	// Do I need to create a sharedStore?
	if (! sharedStorage)
		{
		sharedStorage = [[ self alloc] initPrivate];
	} return sharedStorage;

}

- (instancetype)init
{
	[NSException raise:@" Singleton"
				format:@" Use +[ BNRMapPointSorage sharedStorage]"];
	return nil;
}

- (instancetype) initPrivate
{
	self = [super init];
	if (self) {
		_privateItems = [[ NSMutableArray alloc] init];
	}
	return self;
}

- (NSArray *)allItems
{
	return [self.privateItems copy];
}

/*- (BNRMapPoint *) createItem
{
	
	BNRMapPoint *item = [[BNRMapPoint alloc]initWithCoordinate:item.coordinate
														 title:item.title
													  subtitle:item.subtitle];
	[self.privateItems addObject:item];
	return item;

}*/

-(void)createItem:(BNRMapPoint *)point

{
	point = [[BNRMapPoint alloc] init];
	[self.privateItems addObject:point];
}

@end
