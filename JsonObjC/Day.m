//
//  Day.m
//  JsonObjC
//
//  Created by Alexander Zorinov on 2023-09-24.
//

#import <Foundation/Foundation.h>
#import "Day.h"

@implementation Day

    - (instancetype)init {
        self = [super init];
        if (self) {
            _day = @"";
            _date = @"";
            _ID = @"";
        }
        return self;
    }

@end
