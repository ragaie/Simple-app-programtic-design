//
//  WeatherInfo.h
//  ShowCityWheatherApp
//
//  Created by Ragaie Alfy on 9/7/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WeatherInfo : NSManagedObject



@property (nonatomic, retain) NSString * cityID;
@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * descripe;
@property (nonatomic, retain) NSString * humidity;
@property (nonatomic, retain) NSString * imageId;
@property (nonatomic, retain) NSString * speed;
@property (nonatomic, retain) NSString * temp;


-(void)setdataWith : (id)object;
@end

