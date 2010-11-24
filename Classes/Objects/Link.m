//
//  Link.m
//  umuApp
//
//  Created by Erik Ortman on 10/20/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "Link.h"

@implementation Link
@synthesize id, title, url;

-(id)init:(int)pId title:(NSString*)pTitle url:(NSString*)pUrl {
	self.id = pId;
	title = pTitle;
	url = pUrl;
	return self;
}

@end
