//
//  CMGameViewController.m
//  CoolMath
//
//  Created by Juha Sinkkonen on 18/02/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import "CMGameViewController.h"
#import "MathGame.h"
#import "SettingsFactory.h"

@interface CMGameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *answerText;
@property (weak, nonatomic) IBOutlet UIButton *CheckButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIImageView *ResultSignImage;
@property (weak, nonatomic) IBOutlet UILabel *exerciseValue;
@property (weak, nonatomic) IBOutlet UILabel *statsLabel;
@property (strong, nonatomic) SettingsFactory* settingsFactory;

@end

@interface CMGameViewController ()

@property BOOL answerGiven;
@property MathGame* myMathGame;

@end

@implementation CMGameViewController

- (SettingsFactory *)Factory
{
    if (!_settingsFactory){
        _settingsFactory = [[SettingsFactory alloc] init];
    }
    return _settingsFactory;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //_ButtonText.text = @"Testi";
    [self setButtons];
    [self StartGame];
}

-(void) setButtons{
    
    UIImage *buttonImageNormal = [UIImage imageNamed:@"check.png"];
    [self.CheckButton setBackgroundImage:buttonImageNormal forState:UIControlStateNormal];
    UIImage *buttonNextImageNormal = [UIImage imageNamed:@"buttonNext.png"];
    [self.nextButton setBackgroundImage:buttonNextImageNormal forState:UIControlStateNormal];
    self.answerText.keyboardType = UIKeyboardTypeNumberPad;
    
    
    CATransition *transition = [CATransition animation];
    transition.duration = 1.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    
    [self.ResultSignImage.layer addAnimation:transition forKey:nil];
    [self.answerText.layer addAnimation:transition forKey:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)PressUIButton:(id)sender {
    //  _ButtonText.text = @"Text is changed";
    
}
- (void)StartGame{
    CMSettings *settings = [self.Factory Create];
    _myMathGame = [[MathGame alloc] initWithSettings:settings];
    [self prepareGame];
}

-(void) prepareGame
{
   // self.StartButton.hidden = YES;
    [self CreateCalculation];
}
-(void) CreateCalculation{
    
    _exerciseValue.text = [_myMathGame GetExercise];
    self.ResultSignImage.image = nil;
    _answerText.text = @"";
    _answerGiven = NO;
    self.CheckButton.hidden = NO;
    
}
- (IBAction)nextExercise:(id)sender {
    self.ResultSignImage.hidden = YES;
    if (_answerGiven == NO)
    {
        [self.myMathGame AddWrongAnswer];
    }
    [self UpdateStats];
    [self CreateCalculation];
    [self.answerText becomeFirstResponder];
}
- (IBAction)CheckResult:(id)sender {
    
    self.CheckButton.hidden = YES;
    
    NSNumber* result = [self.myMathGame GetLastExerciseResult ];
    
    NSNumber *answer = [NSNumber numberWithInteger:[self.answerText.text integerValue]];
    
    self.ResultSignImage.hidden = NO;
    if ([result isEqualToNumber:answer])
    {
        [self.myMathGame AddRightAnswer];
        UIImage *image = [UIImage imageNamed:@"select.png"];
        self.ResultSignImage.image = image;
        _answerGiven = YES;
    }
    else
    {
        UIImage *image = [UIImage imageNamed:@"wrong.png"];
        self.ResultSignImage.image = image;
        [self.myMathGame AddWrongAnswer];
        
        self.statsLabel.text = [NSString stringWithFormat:@"%ld/%ld", (long)_myMathGame.rightAnswers,(long)_myMathGame.questions];
        _answerGiven = YES;
    }
    [self UpdateStats];
}

-(void) UpdateStats{
    
    //if (answer)
    //{
        self.statsLabel.text = [NSString stringWithFormat:@"%ld/%d", (long)_myMathGame.rightAnswers,_myMathGame.questions];
    //}
    //else
    //{
      
      //  self.statsLabel.text = [NSString stringWithFormat:@"%ld/%d", (long)_myMathGame.rightAnswers,_myMathGame.questions];
    //}


}


@end
