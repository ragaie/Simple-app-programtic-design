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
    NSMutableArray * allCities;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setTitle:@"Cities"];
    mode = @"add";
    
 
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
    
    coreDataManger =  [CoreDataManger new] ;
    
    allCities =  (NSMutableArray*)[coreDataManger loadAllCities];
    [self.tableView reloadData];

}



-(IBAction)showHistory:(id)sender
{
    
    UINavigationController *tempNav = [[UINavigationController alloc] init];
    
    HistoryTableViewController *historyViewController = [[HistoryTableViewController alloc] init];
    
    [historyViewController setCityName:   ((City*)allCities[((UIButton*)sender).tag]).name];
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
    
    [cell.cityDetailButton setTag:indexPath.row];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 100;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [ServieLayer getCityWeatherDetail:[ServieLayer getApiURl: ((City*)allCities[indexPath.row]).name] withTarget:self andCallBack:@selector(responseWeatherDetail:)];

    
   // WeatherDetailsViewController * newtViewController = [[WeatherDetailsViewController alloc] init];
    
  //  [self.navigationController pushViewController:newtViewController animated:YES];
    
    
    
}

-(void)responseWeatherDetail:(id)result{
    
    
    WeatherInfo* tempObject = [NSEntityDescription insertNewObjectForEntityForName:@"WeatherInfo" inManagedObjectContext:coreDataManger.managedObjectContext];
        [tempObject setdataWith:result];
        
        //save weather object for city.
        [coreDataManger saveCityWeatherWith:tempObject];
        //show city weather detail
        WeatherDetailsViewController * nextViewController = [[WeatherDetailsViewController alloc] init];
        
        [nextViewController setTempWeatherDetail:tempObject];
        [self.navigationController pushViewController:nextViewController animated:YES];
        
//    }else{
//
//
//        [[[UIAlertView alloc] initWithTitle:@"Something wrong" message: @"please check your internet connection" delegate:Nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
//
//    }
        
    
    }



-(void)responseCityWeatherDetail:(id)result{

        if ([result objectForKey:@"message"] != nil){
            [[[UIAlertView alloc] initWithTitle:@"Error" message:[result objectForKey:@"message"] delegate:Nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
        
        }
    
        else{
            
          // WeatherInfo *tempObject = [[WeatherInfo alloc] init];

            WeatherInfo* tempObject = [NSEntityDescription insertNewObjectForEntityForName:@"WeatherInfo" inManagedObjectContext:coreDataManger.managedObjectContext];

                [tempObject setdataWith:result];
            

            
            
           
        
            ///check if city name new or old.
            if([coreDataManger saveCity:[result objectForKey:@"name"]] == YES){
              //  City *tempCity = [[City alloc] init];
               // [tempCity setName: [result objectForKey:@"name"]];
               // [allCities addObject:tempCity];
                [[[UIAlertView alloc] initWithTitle:@"Error" message:@"City already added before" delegate:Nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
            }
            //save weather object for city.
            [coreDataManger saveCityWeatherWith:tempObject];
            //show city weather detail
            WeatherDetailsViewController * nextViewController = [[WeatherDetailsViewController alloc] init];
        
            [nextViewController setTempWeatherDetail:tempObject];
            [self.navigationController pushViewController:nextViewController animated:YES];
        
        }
//    }
//    else{
//        
//        [[[UIAlertView alloc] initWithTitle:@"Something wrong" message: @"please check your internet connection" delegate:Nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil] show];
//
//        
//    }

}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [coreDataManger deleteCityHistorywith:((City*)allCities[indexPath.row]).name];
    
    
    
    allCities = (NSMutableArray*)[coreDataManger loadAllCities];
    
    [self.tableView reloadData];
}

@end
