//
//  SettingsFactory.m
//  CoolMath
//
//  Created by Juha Sinkkonen on 21/03/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import "SettingsFactory.h"
#import "UserDefaultsHelper.h"


@implementation SettingsFactory

-(CMSettings *)Create
{
    CMSettings *settings = [[CMSettings alloc]init];
    CMUsedSigns *usedSigns = [[CMUsedSigns alloc]init];
    
    usedSigns.plus = [UserDefaultsHelper getBoolForKey:@"plusmerkki" ];
    usedSigns.minus = [UserDefaultsHelper getBoolForKey:@"minusmerkki" ];
    usedSigns.dividing = YES;
    usedSigns.multiply = YES;
    
    settings.UsedSigns = usedSigns;
    settings.numberCount = [UserDefaultsHelper getIntForkey:@"numbercount" ];
      settings.numberSize = [UserDefaultsHelper getIntForkey:@"numbersize" ];
    
    return settings;
}

@end
