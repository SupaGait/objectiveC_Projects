//
//  CalculatorModel
//  RPMCalculator
//
//  Created by Epita on 20/04/16.
//  Copyright (c) 2016 nl.gklomphaar. All rights reserved.
//

#import "calculatorModel.h"


@implementation CalculatorModel

@synthesize operandArray = _operandArray;

// Override the default getter method
-(NSMutableArray *)operandArray {
    if(!_operandArray)
        _operandArray = [[NSMutableArray alloc] init];
    return _operandArray;
}

-(void)pushOperand:(double)operand {
    // Pack the double and add
    NSNumber* operandNumber = [[NSNumber alloc] initWithDouble:operand];
    //[_operandArray addObject:operandNumber];
    
    [self.operandArray addObject:operandNumber];
    
    NSLog(@"Model added value: %f", operand);
}

-(double)performOperation:(NSString *)operationType result:(Boolean*)succeded {
    double result = 0;
    
    NSLog(@"Amount of operands in array: %zd", [_operandArray count] );
    
    // Check for minimal 2 operands
    if( [_operandArray count] > 1)
    {
        // Get last two values from the array and remove them.
        NSNumber* Number0 = [_operandArray lastObject];
        [_operandArray removeLastObject];
        NSNumber* Number1 = [_operandArray lastObject];
        [_operandArray removeLastObject];
        
        // Do operations based on input type
        if([operationType isEqualToString: @"+"]) {
            result = [Number0 doubleValue] + [Number1 doubleValue];
        }
        else if ([operationType isEqualToString: @"*"]) {
            result = [Number0 doubleValue] * [Number1 doubleValue];
        }
        else if ([operationType isEqualToString: @"-"]) {
            result = [Number1 doubleValue] - [Number0 doubleValue];
        }
        else if ([operationType isEqualToString: @"/"]) {
            result = [Number1 doubleValue] / [Number0 doubleValue];
        }
        if(succeded)
            *succeded = true;
    }
    else {
        if(succeded)
            *succeded = false;
    }
    
    // Remove all operands if more where in the array
    [_operandArray removeAllObjects];
    return result;
}

@end
