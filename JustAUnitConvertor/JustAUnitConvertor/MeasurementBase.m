//
//  Measurement.m
//  JustAUnitConvertor
//
//  Created by epita on 02/06/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "MeasurementBase.h"

@implementation MeasurementBase

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    _name = name;
    _units = [[NSMutableArray alloc] init];
    return self;
}

-(void)addUnit:(Unit *)unit {
    [_units addObject:unit];
}

-(Unit*)getUnit:(int)index{
    return _units[index];
}

-(NSArray *)getAllUnitNames{
    // Generate the names from the unit objects
    NSMutableArray* names = [[NSMutableArray alloc] init];
    for(int i = 0; i<_units.count; i++) {
        Unit* unit = _units[i];
        [names addObject:unit.name];
    }
    return names;
}

@end
