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
        [self addSubview:self.cityNameLabel];

        
        _cityNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        /* Leading space to superview */
        NSLayoutConstraint *leftButtonXConstraint = [NSLayoutConstraint
                                                     constraintWithItem:_cityNameLabel attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual toItem:self attribute:
                                                     NSLayoutAttributeLeft multiplier:1.0 constant:30];
        /* Top space to superview Y*/
        NSLayoutConstraint *topConstraint = [NSLayoutConstraint
                                                     constraintWithItem:_cityNameLabel attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual toItem:self attribute:
                                                     NSLayoutAttributeTop multiplier:1.0f constant:20];
        /* Fixed width */
//        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.btnCoin
//                                                                           attribute:NSLayoutAttributeWidth
//                                                                           relatedBy:NSLayoutRelationEqual
//                                                                              toItem:nil
//                                                                           attribute:NSLayoutAttributeNotAnAttribute
//                                                                          multiplier:1.0
//                                                                            constant:35];
        /* Fixed Height */
//        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.btnCoin
//                                                                            attribute:NSLayoutAttributeHeight
//                                                                            relatedBy:NSLayoutRelationEqual
//                                                                               toItem:nil
//                                                                            attribute:NSLayoutAttributeNotAnAttribute
//                                                                           multiplier:1.0
//                                                                             constant:12];
        /* 4. Add the constraints to button's superview*/
        
        
        NSLayoutConstraint *constraintVertical = [NSLayoutConstraint constraintWithItem:_cityNameLabel
                                                                              attribute:NSLayoutAttributeCenterY
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self
                                                                              attribute:NSLayoutAttributeCenterY
                                                                             multiplier:1.0f
                                                                               constant:0.0f];
        
        
        
        
        
        NSLayoutConstraint *constraintHorizontal = [NSLayoutConstraint constraintWithItem:_cityNameLabel
                                                                                attribute:NSLayoutAttributeCenterX
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self
                                                                                attribute:NSLayoutAttributeCenterX
                                                                               multiplier:1.0f
                                                                                 constant:0.0f];
        
       // [self addConstraints:@[constraintVertical]];

//
//
 
        
       // _cityNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
      
        //initWithFrame:CGRectMake(5, 10, 300, 30)];
       
       // [self.contentView addConstraints:@ [constraintVertical,constraintHorizontal]];

        
        self.cityNameLabel.textColor = [UIColor blackColor];
        self.cityNameLabel.font = [UIFont fontWithName:@"Chalkduster" size:40];
        
        
        
        [[_cityNameLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:0] setActive:YES];
        [[_cityNameLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:20] setActive:YES];
     
      
    }
    return  self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
