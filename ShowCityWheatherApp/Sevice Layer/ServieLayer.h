//
//  ServieLayer.h
//  ShowCityWheatherApp
//
//  Created by Ragaie Alfy on 9/7/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import <SVProgressHUD.h>


#define ApiKey "f5cb0b965ea1564c50c6f1b74534d823"
#define imageBaseUrl "http://openweathermap.org/img/w/"
#define apiBaseUrl "http://api.openweathermap.org/data/2.5/weather?q="
@interface ServieLayer : NSObject
+(NSString*)getImageURl :(NSString*)imageID;
+(NSString*)getApiURl :(NSString*)CityName;

+(void)getCityWeatherDetail:(NSString*)urlSrtring withTarget :(id) delegate andCallBack :(SEL) callBack;
+(void)renderImagewith : (NSString*)urlString andImageView :(UIImageView*)imageView;
@end
