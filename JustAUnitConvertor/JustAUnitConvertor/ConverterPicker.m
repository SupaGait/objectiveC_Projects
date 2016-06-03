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
    MeasurementBase* _selectedBase;
    NSArray* _measurementUnits;
}

- (instancetype)initMeas:(NSMutableDictionary*)measurementBases selectBase:(NSString*)selectBase {
    self = [super init];
    if (self) {
        _measurementBases = measurementBases;
        _measurementUnits = [[NSArray alloc] init];
        
        // Show first base
        _selectedBase = _measurementBases[selectBase];
        _measurementUnits = [_selectedBase getAllUnitNames];
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
    
    switch (component) {
        case 0:{
            Unit* fromUnit = [_selectedBase getUnit:(int)row];
            [_converter setConversionFrom:fromUnit];
            break;
        }
        case 1:{
            Unit* toUnit = [_selectedBase getUnit:(int)row];
            [_converter setConversionTo:toUnit];
            break;
        }
        default:
            break;
    }
}

-(void)selectMeasurementType:(NSString*)baseName
{
    NSLog(@"Convertor update: %@", baseName);
    
    // Update data
    _selectedBase = _measurementBases[baseName];
    _measurementUnits = [_selectedBase getAllUnitNames];
    
    // Reload the view
    if(_pickerUIView){
        [_pickerUIView reloadAllComponents];
    }
}

@end
