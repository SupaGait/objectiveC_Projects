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

-(NSArray*)getMeasurementNames;
-(void)setConversionFrom:(Unit*)fromUnit;
-(void)setConversionTo:(Unit*)toUnit;
-(double)convert:(double)inputValue;

@end
