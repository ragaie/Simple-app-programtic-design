//
//  CoreDataManger.h
//  ShowCityWheatherApp
//
//  Created by Ragaie Alfy on 9/7/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

#import "City.h"
#import "WeatherInfo.h"
@interface CoreDataManger : NSObject
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//
- (BOOL)saveCity : (NSString*)name;
-(NSArray*) loadAllCities;
-(NSArray*) loadAllCityHistorywith: (NSString*)cityName;
- (void)saveCityWeatherWith : (WeatherInfo*)WeatherData;


-(void) deleteCityHistorywith: (NSString*)cityName;

@end
