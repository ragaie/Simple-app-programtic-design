//
//  CoreDataManger.m
//  ShowCityWheatherApp
//
//  Created by Ragaie Alfy on 9/7/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import "CoreDataManger.h"


@implementation CoreDataManger
@synthesize managedObjectContext = _managedObjectContext;

-(instancetype)init{

    
    self = [super init];
    
  
    
    return self;
    
    
}

-(NSArray*) loadAllCities{
    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    
    NSArray * result = [_managedObjectContext executeFetchRequest:fetchRequest error:NULL];
//
//    for (City * item  in result){
//
//        NSLog(@"%@",item.name);
//
//    }
    return result;

}



- (void)saveCity : (NSString*)name
{

    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }

    City* item = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:_managedObjectContext];
    [item setName:name];
  
    NSError *error = nil;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
    }
}


- (void)saveCityWeatherWith : (WeatherInfo*)WeatherData
{
    
    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }
    
    WeatherInfo* item = [NSEntityDescription insertNewObjectForEntityForName:@"WeatherInfo" inManagedObjectContext:_managedObjectContext];
    [item setDate:[NSDate new]];
    [item setTemp:WeatherData.temp];
    [item setSpeed:WeatherData.speed];
    [item setCityID:WeatherData.cityID];
    [item setImageId:WeatherData.imageId];
    [item setCityName:WeatherData.cityName];
    
    NSError *error = nil;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
    }
}


-(NSArray*) loadAllCityHistorywith: (NSString*)cityName{
    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"WeatherInfo"];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"cityName%@",cityName];
    [fetchRequest setSortDescriptors:@[sort]];
    [fetchRequest setPredicate: predicate];
    
    NSArray * result = [_managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    return result;
    
}



/// delete city with all history of it.
-(void) deleteCityHistorywith: (NSString*)cityName{
    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"WeatherInfo"];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"cityName%@",cityName];
    [fetchRequest setPredicate: predicate];
    
    
    //delete city form cities table
    NSArray * result = [_managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        for (WeatherInfo * item  in result){
            [_managedObjectContext deleteObject:item];
        }
    NSFetchRequest * fetchRequest2 = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    NSPredicate * predicate2 = [NSPredicate predicateWithFormat:@"name%@",cityName];
    [fetchRequest setPredicate: predicate];
    
    NSArray * result2 = [_managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    for (City * item  in result){
        [_managedObjectContext deleteObject:item];
        
    }
    
    [_managedObjectContext save:NULL];
}




@end
