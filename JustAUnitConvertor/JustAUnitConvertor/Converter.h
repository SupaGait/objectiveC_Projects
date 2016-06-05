//
//  Convertor.h
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasurementBase.h"

@interface Converter : NSObject

@property (nonatomic) double inputValue;
@property (nonatomic) double outputValue;

@property (nonatomic) Unit* fromUnit;
@property (nonatomic) Unit* toUnit;
@property (nonatomic, readonly) MeasurementBase* selectedBase;

-(void)setMeasurementBase:(NSString*)baseName;
-(NSArray*)getMeasurementNames;
-(NSArray*)getCurrentUnitNames;

-(void)setDataChangeCallback:(id)callback;

@end

// Callback for data change
@interface NSObject(ConverterCallbacks)
- (void)convertorOutputDidChange:(Converter*)convertor andMeasurementBaseChanged:(bool)baseHasChanged;
@end
