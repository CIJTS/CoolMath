//
//  ExerciseFactory.h
//  Testing
//
//  Created by Juha Sinkkonen on 14/02/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercise.h"

@interface ExerciseFactory : NSObject

-(Exercise *)Create:(CMSettings *)settings;

@end
