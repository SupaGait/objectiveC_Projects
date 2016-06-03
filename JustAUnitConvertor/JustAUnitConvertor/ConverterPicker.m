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

- (instancetype)initMeas:(NSMutableDictionary*)measurementBases selectBase:(NSString*)selectBase {
    self = [super init];
    if (self) {
        _measurementBases = measurementBases;
        _measurementUnits = [[NSArray alloc] init];
        
        // Show first base
        MeasurementBase* measurementBase = _measurementBases[selectBase];
        _measurementUnits = [measurementBase getAllUnitNames];
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
    
    // Update data
    MeasurementBase* measurementBase = _measurementBases[baseName];
    _measurementUnits = [measurementBase getAllUnitNames];
    
    // Reload the view
    if(_pickerUIView){
        [_pickerUIView reloadAllComponents];
    }
}

@end
