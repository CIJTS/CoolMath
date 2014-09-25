//
//  MathGame.m
//  Testing
//
//  Created by Juha Sinkkonen on 14/01/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import "MathGame.h"
#import "ExerciseFactory.h"
#import "Exercise.h"


@interface MathGame ()

@property (strong, nonatomic) NSMutableArray* data;
@property (strong, nonatomic) ExerciseFactory* exerciseFactory;
@property (strong,nonatomic) NSMutableArray* exercisesArray;
@property (strong,nonatomic) CMSettings* settings;

@end

@implementation MathGame

- (ExerciseFactory *)Factory
{
    if (!_exerciseFactory){
        _exerciseFactory = [[ExerciseFactory alloc] init];
    }
    return _exerciseFactory;
}

- (NSMutableArray *)Exercises
{
    if (!_exercisesArray){
        _exercisesArray = [[NSMutableArray alloc] init];
    }
    return _exercisesArray;
}

-(id)initWithInteger:(NSNumber *)Size{
  if ( self = [super init] ) {
      _maxNumber = Size;
      _GameType = 1;
    }
    return self;
}

-(id)initWithSettings:(CMSettings *)settings{
    if ( self = [super init] ) {
        _settings = settings;
    }
    return self;
}

-(NSString *) GetExercise{
    
   Exercise *exercise = (Exercise*)[self.Factory Create:_settings];
    NSMutableArray *exer = [self Exercises];
    [ exer addObject:exercise];
    return [exercise GetExerciseString];
}

-(NSNumber *) GetLastExerciseResult{
     Exercise *exercise = (Exercise*)[_exercisesArray lastObject];
    return [exercise GetResult];
}

-(void) AddRightAnswer{
    _rightAnswers = _rightAnswers + 1;
    _questions +=1;
}
-(void) AddWrongAnswer{
    _wrongAnswers = _wrongAnswers + 1;
    _questions +=1;
}

-(NSString *) GetStats
{
NSString *stats = [NSString stringWithFormat:@"%d/%d", _rightAnswers,_wrongAnswers + _rightAnswers];
return stats;
}

@end
