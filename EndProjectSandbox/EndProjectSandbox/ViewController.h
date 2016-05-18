//
//  ViewController.h
//  EndProjectSandbox
//
//  Created by Epita on 18/05/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

- (IBAction)button_up:(id)sender;


@end

