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
    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }
    
    return self;
    
    
}

-(NSArray*) loadAllCities{
    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    
    NSArray * result = [_managedObjectContext executeFetchRequest:fetchRequest error:NULL];

    return result;

}


//save city object
- (BOOL)saveCity : (NSString*)name
{

    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }

    
    
    NSFetchRequest * fetchRequest2 = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    NSPredicate * predicate2 = [NSPredicate predicateWithFormat:@"name = %@",name];
    [fetchRequest2 setPredicate: predicate2];
    
    NSArray * result2 = [_managedObjectContext executeFetchRequest:fetchRequest2 error:NULL];
    
    if (result2.count == 0){
        
        
        City* item = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:_managedObjectContext];
        [item setName:name];
        
        NSError *error = nil;
        if (![_managedObjectContext save:&error]) {
            NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
        }
        return NO;
        
    }
    else{
        
      
        return YES;
    }
  
}

//save wheater data
- (void)saveCityWeatherWith : (WeatherInfo*)WeatherData
{
    
    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }
    

    NSError *error = nil;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
    }
}

///load city with history
-(NSArray*) loadAllCityHistorywith: (NSString*)cityName{
    
    if (_managedObjectContext ==NULL){
        
        AppDelegate *del = (AppDelegate*)UIApplication.sharedApplication.delegate;
        _managedObjectContext = del.persistentContainer.viewContext;
    }
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"WeatherInfo"];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"cityName = %@",cityName];
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
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"cityName = %@",cityName];
    [fetchRequest setPredicate: predicate];
    
    
    //delete city form cities table
    NSArray * result = [_managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        for (WeatherInfo * item  in result){
            [_managedObjectContext deleteObject:item];
        }
    NSFetchRequest * fetchRequest2 = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    NSPredicate * predicate2 = [NSPredicate predicateWithFormat:@"name = %@",cityName];
    [fetchRequest2 setPredicate: predicate2];
    
    NSArray * result2 = [_managedObjectContext executeFetchRequest:fetchRequest2 error:NULL];
    
    for (City * item  in result2){
        [_managedObjectContext deleteObject:item];
        
    }
    
    [_managedObjectContext save:NULL];
}




@end
