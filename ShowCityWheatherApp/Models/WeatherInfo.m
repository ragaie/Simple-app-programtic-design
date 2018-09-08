//
//  WeatherInfo.m
//  ShowCityWheatherApp
//
//  Created by Ragaie Alfy on 9/7/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import "WeatherInfo.h"

@implementation WeatherInfo


//@synthesize cityID = _cityID;
//@synthesize cityName = _cityName;
//@synthesize date = _date;
//@synthesize descripe = _descripe;
//@synthesize humidity = _humidity;
//@synthesize imageId = _imageId;
//@synthesize speed = _speed;
//@synthesize temp = _temp;

@dynamic cityID;
@dynamic cityName;
@dynamic date;
@dynamic descripe;
@dynamic humidity;
@dynamic imageId;
@dynamic speed;
@dynamic temp;

-(void)setdataWith : (id)object{
    
    [ self setCityID:  [ [object objectForKey:@"id"] stringValue] ];
    [ self setDate: [NSDate new]];
    [ self setCityName:   [object objectForKey:@"name"]];
    [ self setDescripe:   [[[object objectForKey:@"weather"]objectAtIndex:0] objectForKey:@"description"] ];
    [ self setImageId:   [[[object objectForKey:@"weather"]objectAtIndex:0] objectForKey:@"icon"] ];

    [ self setHumidity:  [ [(NSDictionary*)[object objectForKey:@"main"] objectForKey:@"humidity"] stringValue] ];
    [ self setTemp:  [ [(NSDictionary*)[object objectForKey:@"main"] objectForKey:@"temp"] stringValue]];


    [ self setSpeed:   [[(NSDictionary*)[object objectForKey:@"wind"] objectForKey:@"speed"] stringValue]];


    
}

@end


