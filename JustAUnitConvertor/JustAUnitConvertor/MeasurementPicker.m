//
//  MeasurementPicker.m
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "MeasurementPicker.h"

@implementation MeasurementPicker

NSArray* _measurementTypes;


- (instancetype)init
{
    self = [super init];
    if (self) {
        _measurementTypes = @[@"Area", @"Length", @"Temperature"];
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _measurementTypes.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _measurementTypes[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Selected row:%ld component:%ld", row, component);
}

-(MeasurementType)getSelectedMeasurementType{
    // TODO
    return AreaMeasurementType;
}


@end
