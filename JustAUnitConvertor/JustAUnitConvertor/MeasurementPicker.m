//
//  MeasurementPicker.m
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "MeasurementPicker.h"

@implementation MeasurementPicker{
    NSArray* _measurementBaseNames;
}
- (instancetype)init:(NSArray*) measurementBaseNames
{
    self = [super init];
    if (self) {
        _measurementBaseNames = measurementBaseNames;
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _measurementBaseNames.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _measurementBaseNames[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Selected row:%ld component:%ld", row, component);
    
    _selectedBaseName = _measurementBaseNames[row];
    
    if(_convertorPicker){
        [_convertorPicker selectMeasurementType:_selectedBaseName];
    }
}

@end
