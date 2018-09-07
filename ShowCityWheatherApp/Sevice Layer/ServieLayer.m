//
//  ServieLayer.m
//  ShowCityWheatherApp
//
//  Created by Ragaie Alfy on 9/7/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import "ServieLayer.h"

@implementation ServieLayer
+(NSString *)getImageURl:(NSString *)imageID{
    
    return [[NSString alloc] initWithFormat:@"%s%@.png",imageBaseUrl,imageID];

    
}
+(NSString *)getApiURl:(NSString *)CityName{
//#define apiBaseUrl "http://api.openweathermap.org/data/2.5/weather?q=<city Name>&appid=<>"

    return [[NSString alloc] initWithFormat:@"%s%@&appid=%s",apiBaseUrl,CityName,ApiKey];
    
}


+(void)getCityWeatherDetail:(NSString *)urlSrtring withTarget:(id)delegate andCallBack:(SEL)callBack{
    
    
    
//    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
//    }];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString: urlSrtring];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    
    [SVProgressHUD show];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        [SVProgressHUD dismiss];

//        if (error) {
//            NSLog(@"Error: %@", error);
//        } else {
//
        
        
        [delegate performSelectorOnMainThread:callBack withObject:responseObject waitUntilDone:NO];
        //}
    }];
    [dataTask resume];
    
}

+(void)renderImagewith:(NSString *)urlString andImageView:(UIImageView *)imageView{
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:urlString]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            imageView.image=[UIImage imageWithData:data];
            
        });
        data=nil;
    });
    
    
}
@end
