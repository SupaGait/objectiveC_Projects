//
//  MeasurementPicker.h
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConverterPicker.h"

@interface MeasurementPicker : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic)NSString* selectedBaseName;
@property (nonatomic)ConverterPicker* convertorPicker;

- (instancetype)init:(NSArray*)measurementBaseNames;

@end
