//
//  BNRTableViewController.m
//  FollowMyPins
//
//  Created by Richard on 7/3/14.
//  Copyright (c) 2014 Team_7. All rights reserved.
//

#import "BNRTableViewController.h"
#import "BNRMapPoint.h"
#import "BNRViewController.h"
#import "BNRMapPointStorage.h"


@implementation BNRTableViewController

- (instancetype)init
{
	self = [super initWithStyle:UITableViewStylePlain];
	if(self){
		self.tabBarItem.title = @"TABLE";
	}

	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.tableView registerClass:[ UITableViewCell class]
			forCellReuseIdentifier:@" UITableViewCell"];

}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return [[[BNRMapPointStorage sharedStorage] allItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell =
	[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
									forIndexPath:indexPath];


	NSArray *items = [[BNRMapPointStorage sharedStorage] allItems];
	BNRMapPoint *point = items[indexPath.row];

	cell.textLabel.text = [point description];

	return cell;
}
@end
