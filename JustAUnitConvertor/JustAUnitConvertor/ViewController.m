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

@interface ViewController ()



@end

@implementation ViewController

MeasurementPicker* _measurmenControl;
ConverterPicker* _converterControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Instantiate the picker data sources
    _measurmenControl = [[MeasurementPicker alloc] init];
    _converterControl = [[ConverterPicker alloc] init];
    
    // Attach to the data source class
    _measurementPicker.dataSource = _measurmenControl;
    _measurementPicker.delegate = _measurmenControl;
    
    _converterPicker.dataSource = _converterControl;
    _converterPicker.delegate = _converterControl;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
