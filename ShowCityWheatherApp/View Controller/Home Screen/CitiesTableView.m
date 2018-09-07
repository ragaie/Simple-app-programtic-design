//
//  CitiesTableView.m
//  ShowCityWheatherApp
//
//  Created by Ragaie alfy on 9/6/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import "CitiesTableView.h"

@interface CitiesTableView ()



@end

@implementation CitiesTableView
{
    NSString *mode;
    UITextField *searchText;
    
    CoreDataManger *coreDataManger;
    NSArray * allCities;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setTitle:@"Cities"];
    mode = @"add";
    
   coreDataManger =  [CoreDataManger new] ;
   
   allCities =  [coreDataManger loadAllCities];

  //Edit overview of tableView
    
    UIImageView * background =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeScreen"]] ;
    
    [background setAlpha:0.7];
    [self.tableView  setBackgroundView:   background ];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.tableView setSeparatorColor: [UIColor blackColor]];
 
    //Register cell and set setting of mask.
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.tableView registerClass:[CityTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]
      initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(Add:)] ;
    
    
}







-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:NO];

}



-(IBAction)showHistory:(id)sender
{
    
    UINavigationController *tempNav = [[UINavigationController alloc] init];
    
    HistoryTableViewController *historyViewController = [[HistoryTableViewController alloc] init];
    
    [tempNav addChildViewController:historyViewController];
    [self.navigationController presentViewController:tempNav animated:YES completion:NULL];
    
}

-(IBAction)Add:(id)sender
{
   
    
    if (searchText != nil){
        if (![searchText.text isEqualToString:@""]){
            [self.navigationItem.rightBarButtonItem setTitle:@"+"];
            [self.view endEditing:YES];
            UILabel *labelTemp = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
            [labelTemp setText:@"Cities"];
            self.navigationItem.titleView = labelTemp;
            NSLog(@"%@",[ServieLayer getApiURl:searchText.text]);
            [ServieLayer getCityWeatherDetail:[ServieLayer getApiURl:searchText.text] withTarget:self andCallBack:@selector(responseCityWeatherDetail:)];

            searchText = nil;
        }
        else{
            
            [searchText setPlaceholder:@"please enter city name!!!"];
        }
    }
    else{
         searchText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
        [searchText setTextAlignment:NSTextAlignmentCenter];
        [searchText.layer setBorderColor:UIColor.blackColor.CGColor];
        [searchText.layer setBorderWidth:1];
        [searchText.layer setCornerRadius: 5];
        self.navigationItem.titleView = searchText;
        
        [self.navigationItem.rightBarButtonItem setTitle:@"Search"];
        
    }
    
 
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return allCities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     NSString *cellIdentifier = @"Cell";

    
    // Similar to UITableViewCell, but
    CityTableViewCell *cell = (CityTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    cell.cityNameLabel.text = ((City*)allCities[indexPath.row]).name;
    
    [cell.cityDetailButton addTarget:self action:@selector(showHistory:) forControlEvents:UIControlEventTouchUpInside];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 100;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    WeatherDetailsViewController * newtViewController = [[WeatherDetailsViewController alloc] init];
    
    [self.navigationController pushViewController:newtViewController animated:YES];
    
    
    
}


-(void)responseCityWeatherDetail:(id)result{
    NSLog(@"%@", result);
    
    if ([result objectForKey:@"message"] != nil){
        [[[UIAlertView alloc] initWithTitle:@"Error" message:[result objectForKey:@"message"] delegate:Nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
        
    }
    
    else{
        
        
        
        CoreDataManger *hhh =  [CoreDataManger new] ;
        
        [hhh saveCity:@"london"];
    }

}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
