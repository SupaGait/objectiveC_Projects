//
//  ConvertorPicker.m
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "ConverterPicker.h"

@implementation ConverterPicker

- (instancetype)init
{
    self = [super init];
    if (self) {
        //TODO
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;//TODO
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"TODO";
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Selected row:%ld component:%ld", row, component);
}

-(void)selectMeasurementType:(MeasurementType)measurementType
{
    //Todo change text
}

@end
