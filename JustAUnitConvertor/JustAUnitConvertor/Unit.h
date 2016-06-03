//
//  Unit.h
//  JustAUnitConvertor
//
//  Created by epita on 02/06/16.
//  Copyright © 2016 epita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Unit : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) double offset;
@property (nonatomic) double factor;
@property (nonatomic) NSString* unitName;

-(instancetype)initWithName:(NSString*)name offset:(double)offset factor:(double)factor unitName:(NSString*)unitName;

@end
