//
//  Convertor.h
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasurementTypes.h"

@interface Converter : NSObject

-(void)selectMeasurement:(MeasurementType)measurementType;
-(double)convert:(double)inputValue;

@end
