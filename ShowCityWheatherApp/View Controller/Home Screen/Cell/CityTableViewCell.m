//
//  CityTableViewCell.m
//  ShowCityWheatherApp
//
//  Created by Ragaie alfy on 9/6/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell


@synthesize cityNameLabel = _cityNameLabel;
@synthesize cityDetailButton = _cityDetailButton;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        
        
        _cityNameLabel = [[UILabel alloc] init];
        _cityDetailButton = [[UIButton alloc] init];
        [self addSubview:self.cityNameLabel];
        [self addSubview:_cityDetailButton];
        [_cityDetailButton setImage:[UIImage imageNamed:@"information"] forState:UIControlStateNormal];
        _cityNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _cityDetailButton.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.cityNameLabel.textColor = [UIColor blackColor];
        self.cityNameLabel.font = [UIFont fontWithName:@"Chalkduster" size:40];
        [[_cityNameLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:0] setActive:YES];
        [[_cityNameLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:20] setActive:YES];
        
        
        [[_cityDetailButton.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor constant:0] setActive:YES];
        [[_cityDetailButton.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-20] setActive:YES];
       
        [[_cityDetailButton.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor multiplier:0.3 constant:1] setActive:YES];
         [[_cityDetailButton.widthAnchor constraintEqualToAnchor:self.contentView.heightAnchor multiplier:0.3 constant:1] setActive:YES];
      
      
    }
    return  self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
