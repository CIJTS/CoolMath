//
//  CMUsedSigns.h
//  CoolMath
//
//  Created by Juha Sinkkonen on 19/03/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMUsedSigns : NSObject

@property BOOL plus;
@property BOOL minus;
@property BOOL multiply;
@property BOOL dividing;

-(NSMutableArray *)GetUsedSigns;

@end
