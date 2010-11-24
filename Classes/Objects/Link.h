//
//  Link.h
//  umuApp
//
//  Created by Erik Ortman on 10/20/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Link : NSObject {
	int id;
	NSString *title;
	NSString *url;
}

@property (nonatomic) int id; 
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *url;

- (id)init:(int)pId title:(NSString*)pTitle url:(NSString*)pUrl;

@end
