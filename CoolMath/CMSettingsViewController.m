//
//  CMSettingsViewController.m
//  CoolMath
//
//  Created by Juha Sinkkonen on 18/02/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import "CMSettingsViewController.h"
#import "UserDefaultsHelper.h"

@interface CMSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *AddSignToggleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *MinusSignToggleSwitch;
@property (weak, nonatomic) IBOutlet UISlider *numberCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *numberCountValue;
@property (weak, nonatomic) IBOutlet UISlider *numberSizeSlider;
@property (weak, nonatomic) IBOutlet UILabel *numberSizeValue;

@end

@interface CMSettingsViewController()
//@property (strong, nonatomic) UserDefaultsHelper* userDefaultsHelper;

@end

@implementation CMSettingsViewController

//- (UserDefaultsHelper *)UserDefaults
//{
 //   if (!_userDefaultsHelper){
 //       _userDefaultsHelper = [[UserDefaultsHelper alloc] init];
 //   }
 //   return _userDefaultsHelper;
//}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)CheckControlState
{
    if ([UserDefaultsHelper getBoolForKey:@"plusmerkki"])
    {
        [_AddSignToggleSwitch setOn:YES animated:YES];
    }
    else
    {
        [_AddSignToggleSwitch setOn:NO animated:YES];
    }
    
    if ([UserDefaultsHelper getBoolForKey:@"minusmerkki"])
    {
        [_MinusSignToggleSwitch setOn:YES animated:YES];
    }
    else
    {
        [_MinusSignToggleSwitch setOn:NO animated:YES];
    }
    
    int numbCount = [UserDefaultsHelper getIntForkey:@"numbercount"];
    
    [_numberCountSlider setValue:numbCount animated:YES];
    
     _numberCountValue.text = [NSString stringWithFormat:@"%d", numbCount];
    
    int numbSize = [UserDefaultsHelper getIntForkey:@"numbersize"];
    
    [_numberSizeSlider setValue:numbCount animated:YES];
    
    _numberSizeValue.text = [NSString stringWithFormat:@"%d", numbSize];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self CheckControlState];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)AddsignUsage:(id)sender {
   if (_AddSignToggleSwitch.on)
   {
       [UserDefaultsHelper setBoolForKey:YES :@"plusmerkki"];
   }
    else
    {
       [UserDefaultsHelper setBoolForKey:NO :@"plusmerkki"];
   }
}

// MITEN KÄYTETÄÄN SLIDERIN TALLENNUSTA??

- (IBAction)NumberCountSliderMove:(id)sender {
     int sliderValue = [_numberCountSlider value];
     [UserDefaultsHelper setIntForKey:sliderValue :@"numbercount"];
    _numberCountValue.text = [NSString stringWithFormat:@"%d", sliderValue];
}

- (IBAction)MinusSignUsage:(id)sender {
    if (_MinusSignToggleSwitch.on)
    {
        [UserDefaultsHelper setBoolForKey:YES :@"minusmerkki"];
    }
    else
    {
        [UserDefaultsHelper setBoolForKey:NO :@"minusmerkki"];
    }
    
}
- (IBAction)numberSizeSliderMove:(id)sender {
    int sliderValue = [_numberSizeSlider value];
    [UserDefaultsHelper setIntForKey:sliderValue :@"numbersize"];
    _numberSizeValue.text = [NSString stringWithFormat:@"%d", sliderValue];
    //sliderValue;
}

@end
