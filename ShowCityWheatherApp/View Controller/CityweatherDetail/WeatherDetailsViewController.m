//
//  WeatherDetailsViewController.m
//  ShowCityWheatherApp
//
//  Created by Ragaie alfy on 9/6/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import "WeatherDetailsViewController.h"

@interface WeatherDetailsViewController ()

@end

@implementation WeatherDetailsViewController

@synthesize cityNameLabel = _cityNameLabel;
@synthesize dateLabel = _dateLabel;

@synthesize tempLabel = _tempLabel;
@synthesize tempSimpleLabel = _tempSimpleLabel;
@synthesize descriptionLabel = _descriptionLabel;


@synthesize humidityLabel = _humidityLabel;
@synthesize humidityLabelValue = _humidityLabelValue;


@synthesize windSpeedLabel = _windSpeedLabel;
@synthesize windSpeedLabelValue = _windSpeedLabelValue;



@synthesize  tempImage = _tempImage;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTranslucent:YES];

  //  [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setView:   [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"detailPage"]]  ];

    [self initComponents];
    
    [_cityNameLabel setText:@"london"];
    [_dateLabel setText:@"2018-8-13 23:12"];
    
    [_tempLabel setText: @"20"];
    [_tempSimpleLabel setText:@"C"];
    
    [_tempImage setImage:[UIImage imageNamed:@"cloudy"]];
    [_descriptionLabel setText:@"Cloudy"];
    
    [_humidityLabelValue setText:@"15 %"];
    [_windSpeedLabelValue setText:@"15 Kmh"];
    
    [_humidityLabel setText:@"Humidity : "];
    [_windSpeedLabel setText:@"Wind Speed : "];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initComponents{
    
    
    _cityNameLabel = [[UILabel alloc] init];
    [_cityNameLabel setFont:[UIFont boldSystemFontOfSize:40]];
    [_cityNameLabel setTextColor:[ UIColor whiteColor]];
    
    _dateLabel = [[UILabel alloc] init];
    [_dateLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [_dateLabel setTextColor:[ UIColor whiteColor]];
    
    _tempLabel = [[UILabel alloc] init];
    
    [_tempLabel setFont:[UIFont boldSystemFontOfSize: UIScreen.mainScreen.bounds.size.width / 4]];
    [_tempLabel setTextColor:[ UIColor whiteColor]];
    
    _tempSimpleLabel = [[UILabel alloc ] init];
    [_tempSimpleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [_tempSimpleLabel setTextColor:[ UIColor whiteColor]];
    
    
    
    
    _descriptionLabel = [[UILabel alloc] init];
    [_descriptionLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [_descriptionLabel setTextColor:[ UIColor whiteColor]];
    
    
    _humidityLabel = [[UILabel alloc] init];
    _humidityLabelValue = [[UILabel alloc] init];
    [_humidityLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_humidityLabel setTextColor:[ UIColor whiteColor]];
    [_humidityLabelValue setFont:[UIFont boldSystemFontOfSize:16]];
    [_humidityLabelValue setTextColor:[ UIColor whiteColor]];
    
    _windSpeedLabel = [[UILabel alloc] init];
    _windSpeedLabelValue = [[UILabel alloc] init];
    [_windSpeedLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_windSpeedLabel setTextColor:[ UIColor whiteColor]];
    [_windSpeedLabelValue setFont:[UIFont boldSystemFontOfSize:16]];
    [_windSpeedLabelValue setTextColor:[ UIColor whiteColor]];
    
    _tempImage = [[UIImageView alloc] init];
    
    
    [self.view addSubview:_cityNameLabel];
    [self.view addSubview:_dateLabel];
    [self.view addSubview:_tempLabel];
    [self.view addSubview:_tempSimpleLabel];
    [self.view addSubview:_descriptionLabel];
    [self.view addSubview:_humidityLabel];
    [self.view addSubview:_humidityLabelValue];
    [self.view addSubview:_windSpeedLabel];
    [self.view addSubview:_windSpeedLabelValue];
    [self.view addSubview:_tempImage];
    
    [self setConstraintItems];

}
-(void)setConstraintItems{
    
   // _cityNameLabel
    _cityNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _dateLabel.translatesAutoresizingMaskIntoConstraints = NO;

    [[_cityNameLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:0] setActive:YES];
    [[_cityNameLabel.topAnchor  constraintEqualToAnchor:self.view.topAnchor constant:40] setActive:YES];

    
    [[_dateLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:0] setActive:YES];
    [[_dateLabel.topAnchor  constraintEqualToAnchor:_cityNameLabel.bottomAnchor constant:10] setActive:YES];

    
    _tempLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _tempSimpleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _tempImage.translatesAutoresizingMaskIntoConstraints = NO;
    _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _humidityLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _humidityLabelValue.translatesAutoresizingMaskIntoConstraints = NO;
    _windSpeedLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _windSpeedLabelValue.translatesAutoresizingMaskIntoConstraints = NO;
    
    

    
   
    
    [[_tempSimpleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:0] setActive:YES];
    [[_tempSimpleLabel.topAnchor  constraintEqualToAnchor:_dateLabel.bottomAnchor constant:20] setActive:YES];
    
    
    
    
    [[_tempLabel.rightAnchor  constraintEqualToAnchor:_tempSimpleLabel.leftAnchor constant:5] setActive:YES];
    
    [[_tempLabel.topAnchor  constraintEqualToAnchor:_tempSimpleLabel.topAnchor constant:0] setActive:YES];
    
    
    //description label constrain
    [[_descriptionLabel.centerXAnchor  constraintEqualToAnchor:_tempLabel.centerXAnchor constant:0] setActive:YES];
    
    [[_descriptionLabel.topAnchor  constraintEqualToAnchor:_tempLabel.bottomAnchor constant:0] setActive:YES];
    
    
    ///set image constrain
    [[_tempImage.leftAnchor constraintEqualToAnchor:_tempSimpleLabel.rightAnchor constant:5] setActive:YES];
    [[_tempImage.topAnchor  constraintEqualToAnchor:_tempSimpleLabel.bottomAnchor constant:0] setActive:YES];
    
   // [[_tempImage.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:0] setActive:YES];
   // [[_tempImage.heightAnchor  constraintEqualToAnchor:_tempLabel.heightAnchor constant:0] setActive:YES];
    
    [[_tempImage.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.3 constant:1] setActive:YES];
    [[_tempImage.heightAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.3 constant:1] setActive:YES];

    
    
    [[_humidityLabel.rightAnchor  constraintEqualToAnchor:self.view.centerXAnchor constant:0] setActive:YES];
    [[_humidityLabel.topAnchor  constraintEqualToAnchor:_descriptionLabel.bottomAnchor constant:30] setActive:YES];
    
    [[_humidityLabelValue.leftAnchor  constraintEqualToAnchor:_humidityLabel.rightAnchor constant:0] setActive:YES];
    [[_humidityLabelValue.centerYAnchor  constraintEqualToAnchor:_humidityLabel.centerYAnchor constant:0] setActive:YES];
    
    
    [[_windSpeedLabel.rightAnchor  constraintEqualToAnchor:self.view.centerXAnchor constant:0] setActive:YES];
    [[_windSpeedLabel.topAnchor  constraintEqualToAnchor:_humidityLabel.bottomAnchor constant:10] setActive:YES];
    
    [[_windSpeedLabelValue.leftAnchor  constraintEqualToAnchor:_windSpeedLabel.rightAnchor constant:0] setActive:YES];
    [[_windSpeedLabelValue.centerYAnchor  constraintEqualToAnchor:_windSpeedLabel.centerYAnchor constant:0] setActive:YES];
  
    
}

@end
