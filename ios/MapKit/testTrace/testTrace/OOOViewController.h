//
//  OOOViewController.h
//  testTrace
//
//  Created by 大森 智史 on 12/01/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>  

@interface OOOViewController : UIViewController
{
    IBOutlet MKMapView *mapView;
    CLLocationManager* locmanager;  
    
}
-(IBAction)button1:(id)sender;

@end
