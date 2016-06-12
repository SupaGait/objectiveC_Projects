//
//  Unit.h
//  JustAUnitConvertor
//
//  Created by epita on 02/06/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Unit : NSObject

-(instancetype)initWithName:(NSString*)name offset:(double)offset factor:(double)factor unitName:(NSString*)unitName;

@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) double offset;
@property (nonatomic, readonly) double factor;
@property (nonatomic, readonly) NSString* unitName;

// Possibility for custom conversion
@property (nonatomic, copy) double(^toBaseFromUnit)(double inputUnit, double offset, double factor);
@property (nonatomic, copy) double(^toUnitFromBase)(double inputBase, double offset, double factor);

// Conversion methods
-(double)convertToBaseUnitFromValue:(double)value;
-(double)convertToUnitFromBaseValue:(double)baseValue;

@end
