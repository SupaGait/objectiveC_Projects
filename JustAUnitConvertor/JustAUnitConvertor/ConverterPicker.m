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
    return 2; // From and To components
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_converter getMeasurementNames].count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_converter getCurrentUnitNames][row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Selected row:%ld component:%ld", row, component);
    
    switch (component) {
        case 0:{
            Unit* fromUnit = [_converter.selectedBase getUnit:(int)row];
            [_converter setFromUnit:fromUnit];
            break;
        }
        case 1:{
            Unit* toUnit = [_converter.selectedBase getUnit:(int)row];
            [_converter setToUnit:toUnit];
            break;
        }
        default:
            break;
    }
}

@end
