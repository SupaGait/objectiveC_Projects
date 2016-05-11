//
//  ViewController.m
//  Magic8Ball
//
//  Created by Epita on 11/05/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import "ViewController.h"
#import "EightBallModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *phraseLabel;
@property(nonatomic) EightBallModel* eightBallModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _eightBallModel = [EightBallModel alloc];
    [_imageView setImage:[UIImage imageNamed:@"magic-8-ball.jpg"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)giveAnwserPush:(id)sender {
    NSString* anwser = [_eightBallModel getAnwser];
    [_phraseLabel setText:anwser];
}

@end
