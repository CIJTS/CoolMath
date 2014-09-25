//
//  Exercise.m
//  Testing
//
//  Created by Juha Sinkkonen on 09/02/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import "Exercise.h"
#import "CMSettings.h"
#import "GCMathParser.h"

@interface Exercise ()

@property (strong,nonatomic) NSNumber *level;
@property (strong,nonatomic) NSNumber *exerciseType;
@property (strong,nonatomic) NSMutableArray* valueArray;
@property (strong,nonatomic) NSMutableArray* signArray;
@property (strong,nonatomic) NSNumber *maxNumber;
@property (strong,nonatomic) NSMutableArray *signs;
@property (strong,nonatomic) CMSettings *settings;
-(NSNumber *)Calculate:(NSNumber *)number1 number2:(NSNumber *)number2 sign:(NSString *)sign;

@end

@implementation Exercise


-(id)initWithSettings:(CMSettings *) settings
{
    if ( self = [super init] )
    {
        _settings = settings;
        _level = [NSNumber numberWithInt:_settings.numberCount];
        // TODO : Settingssien käyttö tähän.
        [self FormExercise];
    }
    return self;
}
-(void) FormExercise{
    
    _valueArray =  [[NSMutableArray alloc]init];
    for (int i = 0; i < [_level intValue]; i++)
    {
        NSNumber * exerciseValue = [self GetNumber];
        [_valueArray addObject:exerciseValue];
    }
    
    _signArray =  [[NSMutableArray alloc]init];
    for (int i = 0; i < [_level intValue]-1; i++)
    {
        NSString *exerciseSign = [self GetSign];
        NSLog(exerciseSign);
        [_signArray addObject:exerciseSign];
    }
    
    
}

-(NSMutableArray *) GetAllowedSigns
{
    NSMutableArray * allowedSigns =  [[NSMutableArray alloc]init];
    if ([_exerciseType integerValue]== 1)
    {
        if ([_settings.UsedSigns plus] == YES)
        {
            [allowedSigns addObject:@"+"];
        }
        
        if ([_settings.UsedSigns minus] == YES)
        {
            [allowedSigns addObject:@"-"];
        }
        
        if ([_settings.UsedSigns multiply] == YES)
        {
            [allowedSigns addObject:@"·"];
        }
        
        if ([_settings.UsedSigns dividing] == YES)
        {
            [allowedSigns addObject:@"÷"];
        }
    }
    //  @"+",
    //@"-",
    //@"·",
    //@"÷",
    //nil];
    
    return allowedSigns;
}
-(NSString *) GetSign
{
    NSMutableArray *array = _settings.UsedSigns.GetUsedSigns;
    NSUInteger arrayCount = [array count];
    
    NSUInteger randomIndex =  arc4random() % arrayCount;
    ;
    //TODO: HAettava usedsigneista oikea välimerkki
    NSString * selectedSign = [array objectAtIndex:randomIndex];
    return selectedSign;
}

-(NSNumber *) GetNumber{
    NSNumber *myNumber;
    int r = arc4random() % _settings.numberSize;
    myNumber = [NSNumber numberWithInt:r];
    return myNumber;
}

- (NSNumber *) CountResultForSingleCount:(NSMutableArray *)valuesArray signs:(NSMutableArray *)signsArray
{
    NSNumber* result;
    
    NSNumber * exerciseValue1 = [valuesArray objectAtIndex:0];
    NSNumber * exerciseValue2 = [valuesArray objectAtIndex:1];
    
    NSString* currentSign = [signsArray objectAtIndex:0];
    [self Calculate:exerciseValue1 number2:exerciseValue2 sign:currentSign];

    return result;
}



-(NSNumber *) GetResult
{
    NSString *calculation = self.GetExerciseString;
     NSNumber * exerciseResult = [NSNumber numberWithDouble:[calculation evaluateMath]];
    return exerciseResult;
//    if (_signArray.count < 2)
//    {
//        return [self CountResultForSingleCount:_valueArray signs:_signArray];
//    }
//    else
//    {
//        NSNumber *result;
//        // jos kerto tai jakolaskua mukana
//        if ([_signArray containsObject:@"·"] || [_signArray containsObject:@"÷"])
//        {
//            if ([_signArray containsObject:@"·"] && ![_signArray containsObject:@"÷"]) {
//                
//                NSMutableArray* arrayValuesAfterMultiplying;
//                arrayValuesAfterMultiplying =  [[NSMutableArray alloc]init];
//                
//                NSMutableArray* arraySignsAfterMultiplying;
//                arraySignsAfterMultiplying =  [[NSMutableArray alloc]init];
//                
//                for (int i= 0; i < _signArray.count; i ++) {
//                    NSString* currentSign = [_signArray objectAtIndex:i];
//                    
//                    // Jos on kertomerkki ja ja eka kierros menossa
//                    if ([currentSign  isEqual: @"·"] && i==0)
//                    {
//                        NSNumber * exerciseValue1 = [_valueArray objectAtIndex:i];
//                        NSNumber * exerciseValue2 = [_valueArray objectAtIndex:i+1];
//                        
//                        NSNumber * ExerciseResult = @([exerciseValue1 integerValue] * [exerciseValue2 integerValue]);
//                        [arrayValuesAfterMultiplying addObject:ExerciseResult];
//                    }
//                    // Jos on kerto merkki eikä ole eka kierros menossa
//                    else if ([currentSign  isEqual: @"·"] && i!=0)
//                    {
//                        NSNumber * exerciseValue1;
//                        NSNumber * exerciseValue2;
//                        
//                        // Jos edellinen merkki on kertomerkki
//                        if ([[_signArray objectAtIndex:i-1] isEqual: @"·"])
//                        {
//                            exerciseValue1 = [arrayValuesAfterMultiplying objectAtIndex:i-1];
//                            exerciseValue2 = [_valueArray objectAtIndex:i];
//                        }
//                        // Jos edellinen merkki on joku muu
//                        else
//                        {
//                            exerciseValue1 = [_valueArray objectAtIndex:i-1];
//                            exerciseValue2 = [_valueArray objectAtIndex:i];
//                        }
//                        
//                        
//                        NSNumber * ExerciseResult = @([exerciseValue1 integerValue] * [exerciseValue2 integerValue]);
//                        [arrayValuesAfterMultiplying addObject:ExerciseResult];
//                    }
//                    else
//                    {
//                        [arrayValuesAfterMultiplying addObject:[_valueArray objectAtIndex:i]];
//                        [arraySignsAfterMultiplying addObject:currentSign];
//                    }
//                    
//                }
//            }
//        }
//        else
//        {
//            
//            for (int i = 0; i < [_valueArray count]; i++)
//            {
//                if (i==0)
//                {
//                    NSNumber * exerciseValue = [_valueArray objectAtIndex:i];
//                    NSString * exerciseSign = [_signArray objectAtIndex:i];
//                    NSNumber * exerciseValue2 = [_valueArray objectAtIndex:i+1];
//                    result =  [self Calculate:exerciseValue number2:exerciseValue2 sign:exerciseSign];
//                    i++;
//                }
//                else
//                {
//                    NSNumber * exerciseValue = result;
//                    NSString * exerciseSign;
//                    if ([_valueArray count] -1 > i)
//                    {
//                        exerciseSign = [_signArray objectAtIndex:i];
//                    }
//                    NSNumber * exerciseValue2 = [_valueArray objectAtIndex:i];
//                    result =  [self Calculate:exerciseValue number2:exerciseValue2 sign:exerciseSign];
//                }
//            }
//        }
//        return result;
    }
    
    -(NSNumber *)Calculate:(NSNumber *)number1 number2:(NSNumber *)number2 sign:(NSString *)sign{
        
        NSNumber *result;
        
        if ([sign isEqualToString:@"+"])
        {
            result = @([number1 integerValue] + [number2 integerValue]);
        }
        if ([sign isEqualToString:@"-"])
        {
            result = @([number1 integerValue] - [number2 integerValue]);
        }
        if ([sign isEqualToString:@"·"])
        {
            result = @([number1 integerValue] * [number2 integerValue]);
        }
        if ([sign isEqualToString:@"÷"])
        {
            result = @([number1 integerValue] / [number2 integerValue]);
        }
        
        return result;
    }
    
    -(NSString *) GetExerciseString
    {
        NSMutableString *finalString = [NSMutableString string];
        for (int i = 0; i < [self.valueArray count]; i++)
        {
            NSNumber * exerciseValue = [self.valueArray objectAtIndex:i];
            NSString * valueString = [exerciseValue stringValue];
            [finalString appendString:valueString];
            if ([_valueArray count] -1 > i)
            {
                NSString * exerciseSign = [_signArray objectAtIndex:i];
                [finalString appendString:exerciseSign];
            }
        }
        NSLog(finalString);
        return finalString;
    }
    
    @end
