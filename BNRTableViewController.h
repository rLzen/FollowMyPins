//
//  BNRTableViewController.h
//  FollowMyPins
//
//  Created by Richard on 7/3/14.
//  Copyright (c) 2014 Team_7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@class BNRMapPoint;

@interface BNRTableViewController : UITableViewController
<CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, strong)BNRMapPoint *item;

@end
