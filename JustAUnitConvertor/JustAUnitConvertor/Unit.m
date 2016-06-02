//
//  Unit.m
//  JustAUnitConvertor
//
//  Created by epita on 02/06/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "Unit.h"

@implementation Unit

-(instancetype)init:(NSString *)name andFactor:(double)factor {
    self = [super init];
    _name = name;
    _factor = factor;
    return self;
}

@end
