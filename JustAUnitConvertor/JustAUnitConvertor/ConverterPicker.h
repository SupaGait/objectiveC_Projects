//
//  ConvertorPicker.h
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConverterPicker : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView* pickerUIView;

-(instancetype)initMeas:(NSMutableDictionary*)measurementBases selectBase:(NSString*)selectBase;
-(void)selectMeasurementType:(NSString*)baseName;

@end
