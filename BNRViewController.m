//
//  BNRFollowMyPinsViewController.m
//  FollowMyPins
//
//  Created by Richard on 7/2/14.
//  Copyright (c) 2014 Team_7. All rights reserved.
//
#import "BNRMapPointStorage.h"
#import "BNRTableViewController.h"
#import "BNRViewController.h"
#import "BNRMapPoint.h"

@interface BNRViewController ()


@property (weak, nonatomic) IBOutlet UITextField *locationTitleField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;


@property (nonatomic) NSMutableArray *annotations;
@end




@implementation BNRViewController

@synthesize locationTitleField;


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.tabBarItem.title = @"MAP";
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Instance of the location manager
    locationManager = [[CLLocationManager alloc] init];

    // This sets the delegate and request a specific level of accuracy
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	locationManager.requestWhenInUseAuthorization;
	[locationManager startUpdatingLocation];

    self.mapView.showsUserLocation = YES;





}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







#pragma mark - CLLocationManagerDelegate Methods



-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations{

    // Updating fives labels with values from CCLocation
    CLLocation *newLocation = [locations lastObject];

	self.annotations = [[NSMutableArray alloc] initWithArray:locations];

    // Checking for location accruacy
    if (newLocation.verticalAccuracy < 0 || newLocation.horizontalAccuracy < 0) {
        // invalid accuracy
        return;
    }

    if (newLocation.horizontalAccuracy > 100 ||newLocation.verticalAccuracy > 50) {
        // a large radius accruacy is not useful
        return;
    }
    if (previousPoint == nil) {
        totalMovementDistance = 0;

    } else
		{
        totalMovementDistance += [newLocation distanceFromLocation:previousPoint];

		if (totalMovementDistance > inputDistanceFilter) {



			BNRMapPoint *start =
				[[BNRMapPoint alloc]initWithCoordinate:newLocation.coordinate
												 title:newLocation.description
										   subtitle:[NSString stringWithFormat:@"%gm/s",
													 newLocation.speed]];


			[self.mapView addAnnotation:start];

			
			[[BNRMapPointStorage sharedStorage] createItem:start];

			MKCoordinateRegion region;
			region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 100, 100);

			[self.mapView setRegion:region animated:YES];

		}

	 }

	previousPoint = newLocation;

}


- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSString *errorType = (error.code == kCLErrorDenied) ?
    @"Access Denied" : @"Unknown Error";
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Error getting Location"
                          message:errorType
                          delegate:nil
                          cancelButtonTitle:@"Okay"
                          otherButtonTitles:nil];
    [alert show];
}


- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:(MKUserLocation *)userLocation
{

	CLLocationCoordinate2D loc = [userLocation coordinate];
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 100, 100);
	[mapView setRegion:region animated:YES];


}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self setDistanceInterval]; // Set distance to update user location based on user input
    [textField resignFirstResponder]; //Remove the keyboard from the screen
    return YES;
}

- (void)setDistanceInterval
{
	 NSLog(@"%@", NSStringFromSelector(_cmd));
	// Getting the user input and converting to distance
	double newDistance = [locationTitleField.text doubleValue];
	inputDistanceFilter = newDistance;
	[locationManager setDistanceFilter:inputDistanceFilter];
	[locationManager startUpdatingLocation];
	[locationTitleField setText:@""];
	
}

- (void)requestStateForRegion:(CLRegion *)region
{

}



@end
