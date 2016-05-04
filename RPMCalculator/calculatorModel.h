//
//  CalculatorModel.h
//  RPMCalculator
//
//  Created by Epita on 20/04/16.
//  Copyright (c) 2016 nl.gklomphaar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

@property (nonatomic) NSMutableArray *operandArray;

- (void) pushOperand:(double)operand;
- (double) performOperation:(NSString*)operationType result:(Boolean*)succeded;

@end

