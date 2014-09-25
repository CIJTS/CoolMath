//
//  MathGame.h
//  Testing
//
//  Created by Juha Sinkkonen on 14/01/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMSettings.h"

@interface MathGame : NSObject

@property int *GameType;
@property NSNumber *maxNumber;
@property NSInteger questions;
@property NSInteger rightAnswers;
@property NSInteger wrongAnswers;
@property (nonatomic, strong) NSMutableArray *AValues;
- (id)initWithInteger:(NSNumber*)Size;
- (id)initWithSettings:(CMSettings *)settings;
-(NSString *) GetExercise;
-(NSNumber *) GetLastExerciseResult;

-(void) AddRightAnswer;
-(void) AddWrongAnswer;

@end
