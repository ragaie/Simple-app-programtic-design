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
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellHis" forIndexPath:indexPath];
    
    
     NSString *CellIdentifier = @"CellHis";
    UITableViewCell *cell ;///= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    //cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    
    WeatherInfo * tempObj = (WeatherInfo *)allHistory[indexPath.row];
    
   // [cell setFocusStyle:UITableViewCellStyleSubtitle];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd-MM-yyy hh:mm"];  // Output: Sun, 001 May 2011

      [cell.textLabel setText:[dateFormatter stringFromDate:tempObj.date]];
    
    
    [NSString stringWithFormat:@"%@,%.1lf C",tempObj.descripe,([tempObj.temp doubleValue] - 273.15)];
      [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@,%.1lf C",tempObj.descripe,([tempObj.temp doubleValue] - 273.15)]];
    // Configure the cell...
    
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
