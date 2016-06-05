//
//  ViewController.m
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import "ViewController.h"
#import "MeasurementPicker.h"
#import "ConverterPicker.h"

#import "Converter.h"

@interface ViewController ()

@end

@implementation ViewController {
    MeasurementPicker* _measurmentPickerControl;
    ConverterPicker* _converterPickerControl;
    Converter* _convertor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // The convertor
    _convertor = [[Converter alloc] init];
    [_convertor setDataChangeCallback:self]; // Register for data change callback
    
    // Instantiate the picker data sources
    _converterPickerControl = [[ConverterPicker alloc] initWithConverter:_convertor];
    _measurmentPickerControl = [[MeasurementPicker alloc] initWithConverter:_convertor];
    
    // Attach to the data source class
    _measurementPicker.dataSource = _measurmentPickerControl;
    _measurementPicker.delegate = _measurmentPickerControl;
    
    _converterPicker.dataSource = _converterPickerControl;
    _converterPicker.delegate = _converterPickerControl;
    
    // Select the first measurement by default
    //[_measurementPicker selectRow:0 inComponent:0 animated:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"rtn: %@", [_inputTextField text]);
    [_inputTextField resignFirstResponder];
    return true;
}

- (IBAction)inputTextFieldChanged:(id)sender {
    // Convert the input value to the using the convertor
    NSString* inputText = [_inputTextField text];
    NSLog(@"Value: %@",inputText);
    
    _convertor.inputValue = [_inputTextField.text doubleValue];
    //_outputLabel.text = [NSString stringWithFormat:@"%f",_convertor.outputValue];
}

-(void)convertorOutputDidChange:(Converter*)convertor andMeasurementBaseChanged:(bool)baseHasChanged{
    NSLog(@"Converter callback..");
    
    // Reload the component
    if(baseHasChanged){
        // Reset to first unit in the base
        [_converterPicker reloadAllComponents];
        [_converterPicker selectRow:0 inComponent:0 animated:true];
        [_converterPicker selectRow:0 inComponent:1 animated:true];
    }
    _outputLabel.text = [NSString stringWithFormat:@"%f",_convertor.outputValue];
}

@end
