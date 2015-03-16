//
//  APLocationManager.m
//
//
//  Created by Zaid Elkurdi on 3/15/15.
//
//

#import "APLocationManager.h"

@implementation APLocationManager {
  NSInteger count;
  CLLocationManager *locationManager;
  CLLocation *currLocation;
}

#pragma mark - Public Methods

- (id)init {
  if (self = [super init]) {
    count = 0;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.shouldTerminate = NO;
  }
  return self;
}

- (NSDictionary*)getCurrentLocation {
  NSDictionary *dict = @{@"latitude" : @(currLocation.coordinate.latitude),
                         @"longitude" : @(currLocation.coordinate.longitude),
                         @"horizontalAccuracy" : @(currLocation.horizontalAccuracy),
                         @"verticalAccuracy" : @(currLocation.verticalAccuracy),
                         @"speed" : @(currLocation.speed),
                         @"course" : @(currLocation.course),
                         @"timestamp" : currLocation.timestamp};
  
  NSLog(@"Returning: %@", dict);
  return dict;
}

- (void)startMonitoringLocation {
  NSLog(@"Start monitoring!");
  [locationManager startUpdatingLocation];
}

- (void)stopMonitoringLocation {
  NSLog(@"Stop monitoring!");
  [locationManager stopUpdatingLocation];

}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  currLocation = locations.lastObject;
  NSLog(@"APLocationManager: %ld Retrieved location: %@", (long)++count, currLocation);
  [locationManager stopUpdatingLocation];
  
  [self stopMonitoringLocation];
}

@end