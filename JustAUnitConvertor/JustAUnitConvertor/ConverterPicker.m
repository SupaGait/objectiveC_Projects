//
//  ConvertorPicker.m
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "ConverterPicker.h"
#import "MeasurementBase.h"

@implementation ConverterPicker{
    NSMutableDictionary* _measurementBases;
    NSArray* _measurementUnits;
}

- (instancetype)init:(NSMutableDictionary*)measurementBases
{
    self = [super init];
    if (self) {
        _measurementBases = measurementBases;
        _measurementUnits = [[NSArray alloc] init];
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _measurementUnits.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _measurementUnits[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Selected row:%ld component:%ld", row, component);
}

-(void)selectMeasurementType:(NSString*)baseName
{
    NSLog(@"Convertor update: %@", baseName);
    
    MeasurementBase* measurementBase = _measurementBases[baseName];
    _measurementUnits = [measurementBase getAllUnitNames];
}

@end
