//
//  NSArray+Extras.m
//
//  Created by Michał Smulski on 26.09.2012.
//
//

#import "NSArray+Extras.h"

@implementation NSArray (Extras)

- (BOOL)isEmpty
{
	return !([self count] > 0);
}

- (id)firstObject
{
	if ([self isEmpty]) {
		return nil;
	} else {
		return [self objectAtIndex:0];
	}
}

@end
