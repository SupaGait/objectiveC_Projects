//
//  Convertor.m
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "Converter.h"


@implementation Converter{
    MeasurementType _selectedMeasurement;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _selectedMeasurement = MeasurementTypeArea;
    }
    return self;
}

-(void)selectMeasurement:(MeasurementType)measurementType {
    _selectedMeasurement = measurementType;
}


-(double)convert:(double)inputValue{
    
    return 0;
}

@end
