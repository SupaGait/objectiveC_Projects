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
    
    // Instantiate the picker data sources
    _measurmentControl = [[MeasurementPicker alloc] init];
    _converterControl = [[ConverterPicker alloc] init];
    
    // Attach to the data source class
    _measurementPicker.dataSource = _measurmentControl;
    _measurementPicker.delegate = _measurmentControl;
    
    _converterPicker.dataSource = _converterControl;
    _converterPicker.delegate = _converterControl;
    
    // The convertor
    _convertor = [[Converter alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)inputTextFieldChanged:(id)sender {
    // Convert the input value to the using the convertor
    NSString* inputText = [_inputTextField text];
    NSLog(@"%@",inputText);
}
@end
