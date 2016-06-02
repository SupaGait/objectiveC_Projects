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
    MeasurementType _selectedMeasurement;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _measurementBases = [[NSMutableDictionary alloc] init];
        _selectedMeasurement = MeasurementTypeArea;
        [self fillBaseTypes];
    }
    return self;
}

-(void)fillBaseTypes{
    
    // Fill the area base unit
    MeasurementBase* areaBase = [[MeasurementBase alloc] init:@"Area"];
    [areaBase addUnit: [[Unit alloc] init:@"Square kilometre" andFactor:0.000001]];
    [areaBase addUnit: [[Unit alloc] init:@"Square metre" andFactor:1]];
    [areaBase addUnit: [[Unit alloc] init:@"Square foot" andFactor:1]];
    [_measurementBases setObject:areaBase forKey:areaBase.name];
    

    // Fill the length base
    MeasurementBase* lengthBase = [[MeasurementBase alloc] init:@"Length"];
    //TODO
    [_measurementBases setObject:lengthBase forKey:lengthBase.name];
    
    
    // Fill the Temperature base
    MeasurementBase* temperatureBase = [[MeasurementBase alloc] init:@"Temperature"];
    // TODO
    [_measurementBases setObject:temperatureBase forKey:temperatureBase.name];

}

-(NSArray *)getMeasurementNames{
    return [_measurementBases allKeys];
}

-(void)selectMeasurement:(MeasurementType)measurementType {
    _selectedMeasurement = measurementType;
}


-(double)convert:(double)inputValue{
    
    return 0;
}

@end
