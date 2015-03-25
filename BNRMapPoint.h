//
//  BNRMapPoint.h
//  FollowMyPins
//
//  Created by Richard on 7/3/14.
//  Copyright (c) 2014 Team_7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface BNRMapPoint : NSObject <MKAnnotation, MKMapViewDelegate, CLLocationManagerDelegate>
{
	CLLocationCoordinate2D _coordinate;
    NSString *_title;
    NSString *_subtitle;
	CLLocation *newUserLocation;

}

- (id)initWithCoordinate:(CLLocationCoordinate2D)c
				   title:(NSString *)t
				subtitle:(NSString *)s;


@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;


@end
