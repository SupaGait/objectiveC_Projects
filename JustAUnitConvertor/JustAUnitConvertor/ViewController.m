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
    MeasurementPicker* _measurmentControl;
    ConverterPicker* _converterControl;
    Converter* _convertor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // The convertor
    _convertor = [[Converter alloc] init];
    
    // Instantiate the picker data sources
    _converterControl = [[ConverterPicker alloc] initMeas:_convertor.measurementBases selectBase:[_convertor getMeasurementNames][0]];
    _measurmentControl = [[MeasurementPicker alloc] init:[_convertor getMeasurementNames]];
    
    _measurmentControl.convertorPicker = _converterControl;
    _converterControl.converter = _convertor;
    
    // Assign UIviews to UIcontrollers
    _converterControl.pickerUIView = _converterPicker;
    
    // Attach to the data source class
    _measurementPicker.dataSource = _measurmentControl;
    _measurementPicker.delegate = _measurmentControl;
    
    _converterPicker.dataSource = _converterControl;
    _converterPicker.delegate = _converterControl;
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
    
    double inputValue = [_inputTextField.text doubleValue];
    double outputValue = [_convertor convert:inputValue];
    _outputLabel.text = [NSString stringWithFormat:@"%f",outputValue];
}
@end
