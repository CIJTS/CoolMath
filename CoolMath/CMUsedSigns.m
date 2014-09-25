//
//  CMUsedSigns.m
//  CoolMath
//
//  Created by Juha Sinkkonen on 19/03/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import "CMUsedSigns.h"

@interface CMUsedSigns ()

@end

@implementation CMUsedSigns

-(NSMutableArray *)GetUsedSigns
{
    NSMutableArray * allowedSigns =  [[NSMutableArray alloc]init];
        if (_plus == YES)
        {
            [allowedSigns addObject:@"+"];
        }
        
        if (_minus == YES)
        {
            [allowedSigns addObject:@"-"];
        }
        
        if (_multiply == YES)
        {
            [allowedSigns addObject:@"·"];
        }
        
        if (_dividing == YES)
        {
            [allowedSigns addObject:@"÷"];
        }
    return allowedSigns;
}


@end

