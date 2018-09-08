//
//  WeatherDetailsViewController.h
//  ShowCityWheatherApp
//
//  Created by Ragaie alfy on 9/6/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherInfo.h"
#import "ServieLayer.h"

#import "WeatherInfo.h"
@interface WeatherDetailsViewController : UIViewController
@property (nonatomic, strong) UIImageView *tempImage;


@property (nonatomic, strong) UILabel *cityNameLabel;
@property (nonatomic, strong) UILabel *dateLabel;

@property (nonatomic, strong) UILabel *tempLabel;
@property (nonatomic, strong) UILabel *tempSimpleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;


@property (nonatomic, strong) UILabel *humidityLabel;
@property (nonatomic, strong) UILabel *humidityLabelValue;


@property (nonatomic, strong) UILabel *windSpeedLabel;
@property (nonatomic, strong) UILabel *windSpeedLabelValue;


@property (nonatomic, strong) WeatherInfo *tempWeatherDetail;

@end
