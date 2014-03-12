//
//  guessViewController.h
//  YouGuess
//
//  Created by blur on 14-3-11.
//  Copyright (c) 2014年 blur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface guessViewController : UIViewController
- (IBAction)chooseJD:(UIButton *)sender;
- (IBAction)chooseST:(UIButton *)sender;
- (IBAction)chooseB:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic) int scoreValue;
@property (nonatomic) int roundValue;

- (void)changResultLabel:(int) what;
- (void)updateLabel:(int)winOrLose;
- (int)getRandom;


@end
