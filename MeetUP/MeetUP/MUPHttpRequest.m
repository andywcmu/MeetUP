//
//  MUPHttpRequest.m
//  MeetUP
//
//  Created by Andy Wang on 3/29/14.
//  Copyright (c) 2014 Carnegie Mellon University. All rights reserved.
//

#import "MUPHttpRequest.h"

@implementation MUPHttpRequest

// TO BE DONE

//- (void) postPersonData:(int)personId
//                       :(NSString *)firstName
//                       :(NSString *)lastName
//                       :(NSString *)email
//                       :(NSString *)phone
//                       :(NSString *)signUpTime
//                       :(float)locationLatitude
//                       :(float)locationLongtitude
//                       :(NSString *)locationLastUpdated
//{
//  NSString *requestUrl = [NSString stringWithFormat:@"person/%i.json", personId];
//  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//  
//  NSString *latitudeStr = [NSString stringWithFormat:@"%f", locationLatitude];
//  NSString *longtitudeStr = [NSString stringWithFormat:@"%f", locationLongtitude];
//  [request setURL:[NSURL URLWithString:requestUrl]];
//  [request setHTTPMethod:@"GET"];
//  [request setValue:firstName forHTTPHeaderField:@"first_name"];
//  [request setValue:lastName forHTTPHeaderField:@"last_name"];
//  [request setValue:email forHTTPHeaderField:@"email"];
//  [request setValue:phone forHTTPHeaderField:@"phone"];
//  [request setValue:signUpTime forHTTPHeaderField:@"sign_up_time"];
//  [request setValue:latitudeStr forHTTPHeaderField:@"location_latitude"];
//  [request setValue:longtitudeStr forHTTPHeaderField:@"location_longtitude"];
//  [request setValue:locationLastUpdated forHTTPHeaderField:@"location_last_updated"];
////  [request setHTTPBody:postData];
//
//  NSURLResponse *response;
//  NSError *error;
//
//  NSData *jsonData = [NSURLConnection sendSynchronousRequest:request
//                                      returningResponse:&response
//                                      error:&error];
//
//  NSDictionary *results =
//    jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error]
//    : nil;
//
//  if (error) NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
//  
//  NSString *resultsStr = [results description];
//  NSLog(@"%@", resultsStr);
//}

- (NSArray *) getPersonData:(int)personId
{
  NSString *requestUrl = [NSString stringWithFormat:@"http://0.0.0.0:8000/person/%i.json", personId];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
  
  [request setURL:[NSURL URLWithString:requestUrl]];
  [request setHTTPMethod:@"GET"];
  
  NSURLResponse *response;
  NSError *error;
  
  NSData *jsonData = [NSURLConnection sendSynchronousRequest:request
                                           returningResponse:&response
                                                       error:&error];
  
  if (jsonData)
    return [NSJSONSerialization JSONObjectWithData:jsonData
                                           options:NSJSONReadingMutableContainers|
                                                   NSJSONReadingMutableLeaves
                                             error:&error];
  return nil;
}

@end
