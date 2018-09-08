//
//  HistoryTableViewController.m
//  ShowCityWheatherApp
//
//  Created by Ragaie Alfy on 9/7/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import "HistoryTableViewController.h"

@interface HistoryTableViewController ()

@end

@implementation HistoryTableViewController

CoreDataManger *coreDataManger;

NSMutableArray * allHistory;
@synthesize cityName = _cityName;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    coreDataManger =  [CoreDataManger new] ;
    
    allHistory =  (NSMutableArray*)[coreDataManger loadAllCityHistorywith:_cityName];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellHis"];
    
    [self.tableView  setBackgroundColor:[UIColor whiteColor] ];

    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(Dismiss:)] ;
}



-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:NO];
    
}




-(IBAction)Dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL ];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return allHistory.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
     NSString *CellIdentifier = @"CellHis";
    UITableViewCell *cell ;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    
    // Configure the cell...
    
    WeatherInfo * tempObj = (WeatherInfo *)allHistory[indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd-MM-yyy hh:mm"];  // Output: Sun, 001 May 2011
    
    [cell.textLabel setText:[dateFormatter stringFromDate:tempObj.date]];
    
    
    [NSString stringWithFormat:@"%@,%.1lf C",tempObj.descripe,([tempObj.temp doubleValue] - 273.15)];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@,%.1lf C",tempObj.descripe,([tempObj.temp doubleValue] - 273.15)]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    WeatherDetailsViewController * nextViewController = [[WeatherDetailsViewController alloc] init];
    
    [nextViewController setTempWeatherDetail:allHistory[indexPath.row]];
    
    [self.navigationController pushViewController:nextViewController animated:YES];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 70;
}


@end
