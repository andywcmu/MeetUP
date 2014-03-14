//
//  MUPMapViewViewController.m
//  MeetUP
//
//  Created by Andy Wang on 3/13/14.
//  Copyright (c) 2014 Carnegie Mellon University. All rights reserved.
//

#import "MUPMapViewViewController.h"

@interface MUPMapViewViewController ()

@end

@implementation MUPMapViewViewController
{
  GMSMapView *mapView_;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Creates a marker on the map
- (void)createMarker:(float)latitude :(float)longtitude :(NSString *)title :(NSString *)snippet
{
  GMSMarker *marker = [[GMSMarker alloc] init];
  marker.position = CLLocationCoordinate2DMake(latitude, longtitude);
  marker.title = title;
  marker.snippet = snippet;
  marker.map = mapView_;
}

- (void)viewDidLoad
{
//  [super viewDidLoad];
	// Create a GMSCameraPosition that tells the map to display the
  // coordinate -33.86,151.20 at zoom level 6.
  GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                          longitude:151.20
                                                               zoom:1];
  mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
  mapView_.myLocationEnabled = YES;
  self.view = mapView_;
  
  [self createMarker:-33.86 :151.20 :@"Andy" :@"13 mins away"];
  [self createMarker:11.86 :151.20 :@"Jonathan" :@"100 mins away"];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
