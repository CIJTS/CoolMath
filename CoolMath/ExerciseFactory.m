//
//  ExerciseFactory.m
//  Testing
//
//  Created by Juha Sinkkonen on 14/02/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import "ExerciseFactory.h"
#import "Exercise.h"

@implementation ExerciseFactory

-(Exercise *)Create:(CMSettings *)settings{
   
    Exercise *exercise = [[Exercise alloc] initWithSettings:settings ];
    return exercise;
}

@end
