//
//  Measurement.h
//  JustAUnitConvertor
//
//  Created by epita on 02/06/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Unit.h"

@interface MeasurementBase : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSMutableArray* units;

-(instancetype)initWithName:(NSString*)name;
-(void)addUnit:(Unit*)unit;
-(Unit*)getUnit:(int)index;
-(NSArray*)getAllUnitNames;

@end
