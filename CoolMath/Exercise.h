//
//  Exercise.h
//  Testing
//
//  Created by Juha Sinkkonen on 09/02/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMSettings.h"

@interface Exercise : NSObject

-(id)initWithSettings:(CMSettings *) settings;
-(NSString *) GetExerciseString;
-(NSNumber *) GetResult;
@end
