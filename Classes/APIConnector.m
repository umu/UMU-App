//
//  APIConnector.m
//  umuApp
//
//  Created by Erik Ortman on 10/20/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "APIConnector.h"


@implementation APIConnector

@synthesize apiUrl, categoriesUrl, linksUrl, eventsUrl, placesUrl, notesUrl;

-(id)init {
	self.apiUrl = NSLocalizedString(@"apiurl", @"API-urlen"); 
	self.linksUrl = NSLocalizedString(@"apilinks", @"API-urlen för länkar"); 
	self.categoriesUrl = NSLocalizedString(@"apicategories", @"API-urlen för kategorier"); 
	self.eventsUrl = NSLocalizedString(@"apievents", @"API-urlen för events"); 
	self.placesUrl = NSLocalizedString(@"apiplaces", @"API-urlen för platser"); 
	self.notesUrl = NSLocalizedString(@"apiobjects", @"API-urlen för anslag"); 
	return self;
}

/* Links */
-(id) getLinks {
	return [self getArrayFromUrl:self.linksUrl];
}
-(id) getLinkWithId: (int) linkId {
	return [self getArrayFromUrl:[NSString stringWithFormat:@"%@/%i", self.linksUrl, linkId]];
}
-(id) getLinksFromCategories: (NSString *) ids {
	return [self getArrayFromUrl:[NSString stringWithFormat:@"%@/%@/%@", self.linksUrl, @"categories", ids]];
}

/* Notes */
-(id) getNotes {
	return [self getArrayFromUrl:self.notesUrl];
}
-(id) getNoteWithId: (int) noteId {
	return [self getArrayFromUrl:[NSString stringWithFormat:@"%@/%i", self.notesUrl, noteId]];
}
-(id) getNotesFromCategories: (NSString *) ids {
	return [self getArrayFromUrl:[NSString stringWithFormat:@"%@/%@/%@", self.notesUrl, @"categories", ids]];
}

/* Events */
-(id) getEvents {
	return [self getArrayFromUrl:self.eventsUrl];
}
-(id) getEventsWithId: (int) placeId {
	return [self getArrayFromUrl:[NSString stringWithFormat:@"%@/%i", self.placesUrl, placeId]];
}
-(id) getEventsFromCategories: (NSString *) ids {
	return [self getArrayFromUrl:[NSString stringWithFormat:@"%@/%@/%@", self.eventsUrl, @"categories", ids]];
}

/* Places */
-(id) getPlaces {
	return [self getArrayFromUrl:self.placesUrl];
}
-(id) getPlaceWithId: (int) placeId {
	return [self getArrayFromUrl:[NSString stringWithFormat:@"%@/%i", self.placesUrl, placeId]];
}
-(id) getPlacesFromCategories: (NSString *) ids {
	return [self getArrayFromUrl:[NSString stringWithFormat:@"%@/%@/%@", self.placesUrl, @"categories", ids]];
}

-(id) getArrayFromUrl: (NSString *) url {
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	
	// Perform request and get JSON back as a NSData object
	NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	
	// Get JSON as a NSString from NSData response
	NSString *jsonString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];	
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
	NSError *error = nil;
	NSArray *arr = [[CJSONDeserializer deserializer] deserializeAsArray:jsonData error:&error];
	
	[jsonString release];
	[error release];
	
	for (id theKey in arr) {
		NSLog(@"Result: %@", [theKey valueForKey:@"id"]);
	}
	return arr;
}

@end


/*
 
 //[request release]; dont do it
 //[response release]; dont do it
 //[jsonData release]; dont do it
 
 NSLog(@"%d", [dictionary count]);
 NSLog(@"Error: %@", error);
 NSLog(@"Error (User Info): %@", error.userInfo);
 NSLog(@"Result: %@", dictionary);
 
 for (id theKey in dictionary) {
 NSLog(@"Result: %@", [theKey valueForKey:@"id"]);
 }
 */
