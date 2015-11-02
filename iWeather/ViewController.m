//
//  ViewController.m
//  iWeather
//
//  Created by student on 10/30/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *degree;


@end

@implementation ViewController
{
    NSArray* locations;
    NSArray* photos;
    NSArray* quotes;
    BOOL isCelcius;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Windy",@"Sunny",@"Foggy",@"Rainy"];
    locations = @[@"Ha Noi", @"Ho Chi Minh", @"New York", @"London"];
    photos=@[@"windy",@"sunny",@"foggy",@"rainy"];
    isCelcius = true;
}


- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    _quote.text = quotes[quoteIndex];
    
    int locationIndex=arc4random_uniform(locations.count);
    _location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photos.count);
    _weatherIcon.image =[UIImage imageNamed:photos[photoIndex]];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature ]];
    [_temperature setTitle:string forState: UIControlStateNormal];
}
- (IBAction)updateDegree:(id)sender {
    
    if (isCelcius==true ) {
        _degree.text=@"F";
        [_temperature setTitle:[NSString stringWithFormat:@"%.1f",([_temperature.titleLabel.text floatValue]*1.8)+32] forState:UIControlStateNormal]; //Chuyen doi do C thanh do F
        
        isCelcius =false;
    } else {
        _degree.text=@"C";
        [_temperature setTitle:[NSString stringWithFormat:@"%.1f",([_temperature.titleLabel.text floatValue]-32)/1.8] forState:UIControlStateNormal]; //Chuyen doi do F thanh do C

        isCelcius =true;
    }
}

-(float) getTemperature {
    return 6 + arc4random_uniform(25) + (float)arc4random()/(float) INT32_MAX;
}
@end
