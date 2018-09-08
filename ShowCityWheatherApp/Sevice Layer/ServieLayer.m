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
   
    [SVProgressHUD show];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
        NSURL *URL = [NSURL URLWithString: urlSrtring];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    
        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
            [SVProgressHUD dismiss];
        
            if (error == nil){
            
            [delegate performSelectorOnMainThread:callBack withObject:responseObject            waitUntilDone:NO];
            }
            
            else{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                   [[[UIAlertView alloc] initWithTitle:@"Connection Error" message:@"Please check your internet Connection" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil , nil] show];
                    
                });
                
                
            }
        }];
        [dataTask resume];

}

+(void)renderImagewith:(NSString *)urlString andImageView:(UIImageView *)imageView{
    
    UIActivityIndicatorView * indicator = [UIActivityIndicatorView new];
   [ indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite ];
    
    [indicator setFrame:CGRectMake(imageView.frame.origin.x, imageView.frame.origin.y, 20, 20 )]    ;
    
    [imageView addSubview:indicator];
    
    [indicator startAnimating];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:urlString]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [indicator stopAnimating];
            imageView.image=[UIImage imageWithData:data];
            
        });
        data=nil;
    });
    
    
}


@end
