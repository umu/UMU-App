//
//  PlaceMapController.h
//  umuApp
//
//  Created by Erik Ortman on 10/20/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface PlaceMapController : UIViewController<MKMapViewDelegate> {
    MKMapView *mapView;	
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;


@end
