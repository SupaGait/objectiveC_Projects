//
//  Convertor.m
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "Converter.h"

@interface Converter()
-(void)doConversion;
@end

@implementation Converter{
    NSMutableDictionary* _measurementBases;
    id _delegateDataChange;
    bool _baseHasChanged;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _measurementBases = [[NSMutableDictionary alloc] init];
        _inputValue = 0;
        _outputValue = 0;
        
        [self fillBaseTypes];
        
        // Set default values
        _selectedBase =  _measurementBases[@"Area"];
        _fromUnit = _selectedBase.units[0];
        _toUnit = _selectedBase.units[0];
        _baseHasChanged = true;
    }
    return self;
}

-(void)conversionToBase:(Unit*)unit{
    
}

-(void)fillBaseTypes{
    {
        // Fill the area base unit
        MeasurementBase* areaBase = [[MeasurementBase alloc] initWithName:@"Area"];
        [areaBase addUnit: [[Unit alloc] initWithName:@"Square kilometre" offset:0.0 factor:1000000 unitName:@"km2"]];
        [areaBase addUnit: [[Unit alloc] initWithName:@"Square metre" offset:0.0 factor:1.0 unitName:@"m2" ]];
        [areaBase addUnit: [[Unit alloc] initWithName:@"Square foot" offset:0.0 factor:0.092903 unitName:@"ft2"]];
        [_measurementBases setObject:areaBase forKey:areaBase.name];
    }
    {
        // Fill the length base
        MeasurementBase* lengthBase = [[MeasurementBase alloc] initWithName:@"Length"];
        [lengthBase addUnit: [[Unit alloc] initWithName:@"Kilometer" offset:0.0 factor:1000 unitName:@"km"]];
        [lengthBase addUnit: [[Unit alloc] initWithName:@"Meter" offset:0.0 factor:1.0 unitName:@"m"]];
        [lengthBase addUnit: [[Unit alloc] initWithName:@"Mile" offset:0.0 factor:1609.34 unitName:@"mi"]];
        [lengthBase addUnit: [[Unit alloc] initWithName:@"Foot" offset:0.0 factor:0.3048 unitName:@"ft"]];
        [_measurementBases setObject:lengthBase forKey:lengthBase.name];
    }
    {
        // Fill the Temperature base
        MeasurementBase* temperatureBase = [[MeasurementBase alloc] initWithName:@"Temperature"];
        [temperatureBase addUnit: [[Unit alloc] initWithName:@"Celsius" offset:0.0 factor:1.0 unitName:@"C"]];
        
        Unit *fahrenheitUnit = [[Unit alloc] initWithName:@"Fahrenheit" offset:32 factor:(1.0/1.8) unitName:@"F"];
        fahrenheitUnit.toBaseFromUnit = ^(double inputUnit, double offset, double factor){
            return (inputUnit - offset) * factor;
        };
        fahrenheitUnit.toUnitFromBase = ^(double inputBase, double offset, double factor){
            return inputBase / factor + offset;
        };
        
        [temperatureBase addUnit: fahrenheitUnit];
        [temperatureBase addUnit: [[Unit alloc] initWithName:@"Kelvin" offset:-273.15 factor:1 unitName:@"K"]];
        [_measurementBases setObject:temperatureBase forKey:temperatureBase.name];
    }
}

-(void)setMeasurementBase:(NSString *)baseName{
    // Set the new measurement base, select the first units and invoke a refresh
    _selectedBase = _measurementBases[baseName];
    _fromUnit = _selectedBase.units[0];
    _toUnit = _selectedBase.units[0];
    _baseHasChanged = true;
    [self doConversion];
}

-(void)setInputValue:(double)inputValue{
    _inputValue = inputValue;
    [self doConversion];
}

-(void)setFromUnit:(Unit *)fromUnit{
    _fromUnit = fromUnit;
    [self doConversion];
}

-(void)setToUnit:(Unit *)toUnit{
    _toUnit = toUnit;
    [self doConversion];
}

-(NSArray *)getMeasurementNames{
    return [_measurementBases allKeys];
}

-(NSArray *)getCurrentUnitNames{
    return [_selectedBase getAllUnitNames];
}

-(void)doConversion{
    // Convert the value.
    // Start applying 'from' parameters, which converts to the base SI
    // Then from base SI to the new Unit using 'to' parameters.
    double value = 0;
    if(_fromUnit && _toUnit){
        value = [_fromUnit convertToBaseUnitFromValue:_inputValue];
        value = [_toUnit convertToUnitFromBaseValue:value];
    }
    _outputValue = value;
    [_delegateDataChange convertorOutputDidChange:self andMeasurementBaseChanged:_baseHasChanged];
    
    // Reset base change flag.
    if(_baseHasChanged){
        _baseHasChanged = false;
    }
}

-(void)setDataChangeCallback:(id)callback{
    _delegateDataChange = callback;
}

@end
