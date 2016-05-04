//
//  ViewController.m
//  RPMCalculator
//
//  Created by Epita on 20/04/16.
//  Copyright (c) 2016 nl.gklomphaar. All rights reserved.
//

#import "ViewController.h"
#import "calculatorModel.h"

@interface ViewController ()
       @property(nonatomic) CalculatorModel* calcModel;
@end

@implementation ViewController
    bool clearAtNextInput = true;

- (void)resetInput:(Boolean)setToZero {
    // Show zero on screen, and on next input remove based on flag
    if(setToZero) {
        _label_output.text = @"0";
    }
    clearAtNextInput = true;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    _calcModel = [CalculatorModel alloc];
}

- (IBAction)button_action:(UIButton*)sender {
    //NSLog(@"I Clicked button: %@", sender.currentTitle);
    
    NSString* text = _label_output.text;
    
    // Check for first use, so remove zero
    if (clearAtNextInput) {
        clearAtNextInput = false;
        text = @"";
    }
    
    // Change the label
    _label_output.text = [text stringByAppendingString:sender.currentTitle];
}

- (IBAction)button_pushOperator:(UIButton*)sender {
    // Push the operation to the model, use return status to determine error and reset view.
    Boolean succeded = false;
    double result = [_calcModel performOperation:sender.currentTitle result:&succeded];
    if(succeded) {
        _label_output.text = [NSString stringWithFormat:@"%f", result];
    }
    else {
        _label_output.text = @"Input error";
        [self resetInput:false];
    }
    
}

- (IBAction)button_enter:(UIButton*)sender {
    // Add value to the model, reset unput view
    double value = [_label_output.text doubleValue];
    [_calcModel pushOperand: value];
    [self resetInput:true];
}

@end
