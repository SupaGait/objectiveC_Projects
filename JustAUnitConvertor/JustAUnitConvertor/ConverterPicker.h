//
//  ConvertorPicker.h
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeasurementTypes.h"

@interface ConverterPicker : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

-(void)selectMeasurementType:(MeasurementType)measurementType;

@end
