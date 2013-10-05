//
//  OOOViewController.m
//  testTrace
//
//  Created by Satoshi Oomori on 12/01/21.
//  Copyright (c) 2012 Satoshi Oomori. All rights reserved.
//
//http://developer.apple.com/jp/devcenter/ios/library/documentation/LocationAwarenessPG.pdf

#import "OOOViewController.h"

@implementation OOOViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - MapKit setRegion:

-(IBAction)button1:(id)sender{
    

    // 現在地を表示する
	[mapView setShowsUserLocation:YES];
    
    //[mapView setCenterCoordinate:mapView.userLocation.coordinate animated:YES];
    [mapView setRegion:MKCoordinateRegionMake(mapView.userLocation.coordinate, MKCoordinateSpanMake(15, 5)) animated:YES];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {  
    mapView.centerCoordinate = mapView.userLocation.location.coordinate;  
    

    //[mapView setCenterCoordinate:mapView.userLocation.location.coordinate animated:NO];
    
    //[mapView setCenterCoordinate:mapView.userLocation.coordinate animated:YES];
    [mapView setRegion:MKCoordinateRegionMake(mapView.userLocation.coordinate, MKCoordinateSpanMake(0.02, 0.02)) animated:YES];
    
    
    NSLog(@"!!");
}   


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    mapView.showsUserLocation = YES;  
    [mapView.userLocation addObserver:self forKeyPath:@"location" options:0 context:NULL];  

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
     
    
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
