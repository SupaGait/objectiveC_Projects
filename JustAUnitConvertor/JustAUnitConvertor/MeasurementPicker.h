//
//  MeasurementPicker.h
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Converter.h"

@interface MeasurementPicker : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

- (instancetype)initWithConverter:(Converter*)converter;

@end
