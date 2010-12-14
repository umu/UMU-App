//
//  UMUAnnotation.m
//  umuApp
//
//  Created by Jonny Strömberg on 12/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UMUAnnotation.h"


@implementation UMUAnnotation
@synthesize title, subtitle, coordinate;

- (id) initWithDictionary:(NSDictionary *) dict {
	self = [super init];
	if (self != nil) {
		coordinate.latitude = [[dict objectForKey:@"latitude"] doubleValue];
		coordinate.longitude = [[dict objectForKey:@"longitude"] doubleValue];
		self.title = [dict objectForKey:@"title"];
		self.subtitle = [dict objectForKey:@"text"];
	}
	return self;
}

@end
