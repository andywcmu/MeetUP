//
//  AppToDoItemNSObject.h
//  test
//
//  Created by Andy Wang on 3/12/14.
//  Copyright (c) 2014 Andy Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppToDoItemNSObject : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
