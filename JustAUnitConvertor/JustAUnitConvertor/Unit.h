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
@property (nonatomic) double factor;

-(instancetype)init:(NSString*)name andFactor:(double)factor;

@end
