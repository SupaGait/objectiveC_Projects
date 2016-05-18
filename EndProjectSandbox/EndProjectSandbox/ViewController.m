//
//  ViewController.m
//  EndProjectSandbox
//
//  Created by Epita on 18/05/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end


@implementation ViewController

    NSArray* _pickerData;
    NSArray* _pickerUnitData;
    NSInteger _selectedMeasurement;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _selectedMeasurement = 0;

    // Connect data to our pickerview
    _pickerView.delegate = self;
    
    _pickerData =       @[@"Length", @"Temperature", @"Time", @"Awesomeness ;)"];
    _pickerUnitData =   @[@[@"km", @"m", @"cm", @"mm"],
                          @[@"deg", @"farenheit"],
                          @[@"years", @"days", @"hours", @"minuts", @"seconds"],
                          @[@"at school", @"at work", @"at the bar", @"under the shower"]];
    _pickerView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button_up:(id)sender {
    //[_pickerView
    NSLog(@"%@", [_textField text]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", [_textField text]);
    [_textField resignFirstResponder];
    return true;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component == 0)
        return _pickerData.count;
    else {
        NSArray* subArray = [_pickerUnitData objectAtIndex:component];
        return subArray.count;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pickerData[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"Selected row:%ld component:%ld", row, component);
    
    // Save the selected measurement
    _selectedMeasurement = component;
}

@end

