//
//  ViewController.m
//  Magic8Ball
//
//  Created by Epita on 11/05/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import "EightBallModel.h"

@interface EightBallModel ()
@property (nonatomic) NSArray* anwserList;
@end

@implementation EightBallModel

@synthesize anwserList = _anwserList;

-(NSArray*)anwserList {
    // Populate the anwserList array
    if(!_anwserList)
        _anwserList = [[NSArray alloc] initWithObjects:
                       @"Yes do it",
                       @"No way man",
                       @"Ask your mother",
                       @"Only if its a sunny day",
                       @"Do 1000 pushups and think again",
                       @"Better sleep a night about it",
                       @"What would Johny do?",
                       @"The answer is 42!",
                       nil];
    return _anwserList;
}

- (NSString*)getAnwser {
    // Create a random number
    NSInteger randomNumber = arc4random() % 8;
    NSLog(@"number: %ld", randomNumber);
    
    // Return the anwser
    return [self.anwserList objectAtIndex:randomNumber];
}

@end
