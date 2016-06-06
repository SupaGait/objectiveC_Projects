//
//  MeasurementPicker.m
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "MeasurementPicker.h"

@implementation MeasurementPicker{
    Converter* _converter;
}
- (instancetype)initWithConverter:(Converter*)converter
{
    self = [super init];
    if (self) {
        _converter = converter;
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_converter getMeasurementNames].count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_converter getMeasurementNames][row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Selected row:%ld component:%ld", (long)row, component);
    
    NSString* measName = [_converter getMeasurementNames][row];
    [_converter setMeasurementBase: measName];
}

@end
