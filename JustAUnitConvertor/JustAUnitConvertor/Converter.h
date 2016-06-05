//
//  Convertor.h
//  JustAUnitConvertor
//
//  Created by epita on 27/05/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"

@interface Converter : NSObject

@property (nonatomic) NSMutableDictionary* measurementBases;
@property (nonatomic) double inputValue;
@property (nonatomic) double outputValue;

-(NSArray*)getMeasurementNames;
-(void)setConversionFrom:(Unit*)fromUnit;
-(void)setConversionTo:(Unit*)toUnit;

-(void)setDataChangeCallback:(id)callback;

@end

// Callback for data change
@interface NSObject(ConverterCallbacks)
- (void)convertorOutputDidChange:(Converter*)convertor;
@end
