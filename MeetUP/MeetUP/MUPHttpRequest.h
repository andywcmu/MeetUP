//
//  MUPHttpRequest.h
//  MeetUP
//
//  Created by Andy Wang on 3/29/14.
//  Copyright (c) 2014 Carnegie Mellon University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUPHttpRequest : NSObject

- (NSArray *) getPersonData:(int)personId;

@end