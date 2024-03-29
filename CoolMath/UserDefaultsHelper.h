//
//  UserDefaultsHelper.h
//  CoolMath
//
//  Created by Juha Sinkkonen on 06/03/14.
//  Copyright (c) 2014 Juha Sinkkonen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserDefaultsHelper : NSObject {
}

+(NSString*)getStringForKey:(NSString*)key;
+(NSInteger)getIntForkey:(NSString*)key;
+(NSDictionary*)getDictForKey:(NSString*)key;
+(NSArray*)getArrayForKey:(NSString*)key;
+(BOOL)getBoolForKey:(NSString*)key;
+(void)setStringForKey:(NSString*)value:(NSString*)key;
+(void)setIntForKey:(NSInteger)value:(NSString*)key;
+(void)setDictForKey:(NSDictionary*)value:(NSString*)key;
+(void)setArrayForKey:(NSArray*)value:(NSString*)key;
+(void)setBoolForKey:(BOOL)value:(NSString*)key;

@end