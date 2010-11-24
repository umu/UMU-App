//
//  MapOverlay.m
//  umuApp
//
//  Created by Jonny Strömberg on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MapOverlay.h"


@implementation MapOverlay


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context{
    // Load image from applicaiton bundle
    NSString* imageFileName = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Icon.png"];
    CGDataProviderRef provider = CGDataProviderCreateWithFilename([imageFileName UTF8String]);
    CGImageRef image = CGImageCreateWithPNGDataProvider(provider, NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(provider);
	
    MKMapRect overlayMapRect = [self.overlay boundingMapRect];
    CGRect overlayRect = [self rectForMapRect:overlayMapRect];
	
    // draw image
    CGContextSaveGState(context);
    CGContextDrawImage(context, overlayRect, image);
    CGContextRestoreGState(context);
	
    CGImageRelease(image);
	
}


- (void)dealloc {
    [super dealloc];
}


@end
