//
//  APIConnector.h
//  umuApp
//
//  Created by Erik Ortman on 10/20/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJSONDeserializer.h" 

@interface APIConnector : NSObject {
	NSString *apiUrl;
	NSString *linksUrl;
	NSString *categoriesUrl;
	NSString *eventsUrl;
	NSString *placesUrl;
	NSString *notesUrl;
}

@property (nonatomic, retain) NSString *apiUrl;
@property (nonatomic, retain) NSString *linksUrl;
@property (nonatomic, retain) NSString *categoriesUrl;
@property (nonatomic, retain) NSString *eventsUrl;
@property (nonatomic, retain) NSString *placesUrl;
@property (nonatomic, retain) NSString *notesUrl;

/* Links */
-(id) getLinks;
-(id) getLinkWithId: (int) linkId;
-(id) getLinksFromCategories: (NSString *) ids;

/* Notes */
-(id) getNotes;
-(id) getNoteWithId: (int) noteId;
-(id) getNotesFromCategories: (NSString *) ids;

/* Events */
-(id) getEvents;
-(id) getPlaceWithId: (int) placeId;
-(id) getEventsFromCategories: (NSString *) ids;

/* Places */
-(id) getPlaces;
-(id) getPlaceWithId: (int) placeId;
-(id) getPlacesFromCategories: (NSString *) ids;

-(id) getArrayFromUrl: (NSString *) url;


@end
