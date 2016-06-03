//
//  Unit.m
//  JustAUnitConvertor
//
//  Created by epita on 02/06/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "Unit.h"

@implementation Unit

-(instancetype)initWithName:(NSString*)name offset:(double)offset factor:(double)factor unitName:(NSString*)unitName {
    self = [super init];
    _name = name;
    _offset = offset;
    _factor = factor;
    _unitName = unitName;
    return self;
}

@end
