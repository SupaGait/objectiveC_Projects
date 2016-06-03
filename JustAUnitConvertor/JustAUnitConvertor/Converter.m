//
//  Convertor.m
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "Converter.h"
#import "MeasurementBase.h"

@implementation Converter{
    Unit* _fromUnit;
    Unit* _toUnit;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _measurementBases = [[NSMutableDictionary alloc] init];
        [self fillBaseTypes];
    }
    return self;
}

-(void)fillBaseTypes{
    {
        // Fill the area base unit
        MeasurementBase* areaBase = [[MeasurementBase alloc] init:@"Area"];
        [areaBase addUnit: [[Unit alloc] initWithName:@"Square kilometre" offset:0.0 factor:1000000 unitName:@"km2"]];
        [areaBase addUnit: [[Unit alloc] initWithName:@"Square metre" offset:0.0 factor:1.0 unitName:@"m2" ]];
        [areaBase addUnit: [[Unit alloc] initWithName:@"Square foot" offset:0.0 factor:10.7639 unitName:@"ft2"]];
        [_measurementBases setObject:areaBase forKey:areaBase.name];
    }
    {
        // Fill the length base
        MeasurementBase* lengthBase = [[MeasurementBase alloc] init:@"Length"];
        [lengthBase addUnit: [[Unit alloc] initWithName:@"Kilometer" offset:0.0 factor:1000 unitName:@"km"]];
        [lengthBase addUnit: [[Unit alloc] initWithName:@"Meter" offset:0.0 factor:1.0 unitName:@"m"]];
        [lengthBase addUnit: [[Unit alloc] initWithName:@"Mile" offset:0.0 factor:0.000621371 unitName:@"mi"]];
        [lengthBase addUnit: [[Unit alloc] initWithName:@"Foot" offset:0.0 factor:3.28084 unitName:@"ft"]];
        [_measurementBases setObject:lengthBase forKey:lengthBase.name];
    }
    {
        // Fill the Temperature base
        MeasurementBase* temperatureBase = [[MeasurementBase alloc] init:@"Temperature"];
        [temperatureBase addUnit: [[Unit alloc] initWithName:@"Celsius" offset:0.0 factor:1.0 unitName:@"C"]];
        [temperatureBase addUnit: [[Unit alloc] initWithName:@"Fahrenheit" offset:32 factor:1.8 unitName:@"F"]];
        [temperatureBase addUnit: [[Unit alloc] initWithName:@"Kelvin" offset:273.15 factor:1 unitName:@"K"]];
        [_measurementBases setObject:temperatureBase forKey:temperatureBase.name];
    }
}

-(NSArray *)getMeasurementNames{
    return [_measurementBases allKeys];
}

-(void)setConversionFrom:(Unit*)fromUnit{
    _fromUnit = fromUnit;
}
-(void)setConversionTo:(Unit*)toUnit{
    _toUnit = toUnit;
}

-(double)convert:(double)inputValue{
    double value = 0;
    
    // Convert the value.
    // Start applying 'from' parameters, which converts to the base SI
    // Then from base SI to the new Unit using 'to' parameters.
    if(_fromUnit && _toUnit){
        value = inputValue * _fromUnit.factor + _fromUnit.offset;
        value *= 1/_toUnit.factor;
        value += _toUnit.offset;
    }
    return value;
}

@end
