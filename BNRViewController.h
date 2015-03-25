//
//  BNRFollowMyPinsViewController.h
//  FollowMyPins
//
//  Created by Richard on 7/2/14.
//  Copyright (c) 2014 Team_7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRViewController : UIViewController
<CLLocationManagerDelegate, MKMapViewDelegate, UITextViewDelegate>
{
	 CLLocationManager *locationManager;
	 CLLocation *previousPoint;
	 CLLocationDistance totalMovementDistance;
	 CLLocationDistance inputDistanceFilter;

}

@property (copy, nonatomic) NSString *longitude;
@property (copy, nonatomic) NSString *latitude;
@end
