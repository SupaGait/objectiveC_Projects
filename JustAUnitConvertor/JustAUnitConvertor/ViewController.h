//
//  ViewController.h
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *measurementPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *converterPicker;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

- (IBAction)inputTextFieldChanged:(id)sender;

@end

